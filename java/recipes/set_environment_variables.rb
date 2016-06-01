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
            user    "#{deploy[:user]}"
            command "export #{key}=#{variable}"
        end
    end

end
