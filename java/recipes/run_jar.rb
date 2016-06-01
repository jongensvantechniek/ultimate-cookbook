node[:deploy].each do |application, deploy|

    if node[:custom_env][application.to_s]["type"] != "java"
        log "error_incompat" do
            message "This application is not a Java application"
            level   :error
        end
        next
    end

    ## TODO UNSET ENVIRONMENT VARIABLE WITH SAME KEY DIFFERENT VARIABLE AND LAUNCH WARNING IN LOG

    node[:custom_env][application.to_s]["environment_variables"].each do |key, variable|
        execute "set_environment_variable" do
            user    "#{deploy[:user]}"
            cwd     "/home/#{deploy[:user]}"
            command "echo 'export #{key}=#{variable}' >> .profile"
            not_if  "cat .profile | grep #{key}=#{variable}"
        end
    end

    execute "stop_jar" do
        user    "#{deploy[:user]}"
        command "screen -S #{application.to_s} -X quit"
        only_if "screen -ls | grep #{application.to_s}"
    end

    execute "run_jar" do
        user    "#{deploy[:user]}"
        cwd     "#{deploy[:deploy_to]}/current"
        command "screen -dmS #{application.to_s} java -jar #{node[:custom_env][application.to_s]['jar']}"
    end

end
