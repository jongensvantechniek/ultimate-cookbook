node[:deploy].each do |application, deploy|

    if node[:custom_env][application.to_s]["type"] != "java"
        log "error_incompat" do
            message "This application is not a Java application"
            level   :error
        end
        next
    end

    node[:custom_env][application.to_s]["environment_variables"].each do |key, variable|
        execute "set environment variable" do
            user    "root"
            command "echo #{key}=#{variable} >> /etc/environment"
            not_if "cat /etc/environment | grep #{key}=#{variable}"
        end
    end

    execute "stop java jar" do
        user    "#{deploy[:user]}"
        command "screen -S #{application.to_s} -X quit"
        only_if "screen -ls | grep #{application.to_s}"
    end

    execute "start java jar" do
        user "#{deploy[:user]}"
        cwd     "#{deploy[:deploy_to]}/current"
        command "screen -dmS #{application.to_s} java -jar #{node[:custom_env][application.to_s]['jar']}"
    end

end
