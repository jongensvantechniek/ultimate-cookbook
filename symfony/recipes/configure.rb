node[:deploy].each do |application, deploy|

    # Skip deploying if application is not to be configured as a Symfony Application
    if node[:custom_env][application.to_s]["type"] != "symfony"
        log "error_incompat" do
            message "This application is not a Symfony application"
            level   :error
        end
        next
    end

    # Create writable folders and set permissions for writing the folders
    node[:custom_env][application.to_s]["writable_folders"].each do |folder|
        script "update_acl" do
            interpreter     "bash"
            user            "root"
            cwd             "#{deploy[:deploy_to]}/current"
            code            <<-EOH
                            mkdir -p #{folder}
                            mount -o remount,acl /srv/www
                            setfacl -R -m u:www-data:rwX -m u:ubuntu:rwX #{folder}
                            setfacl -dR -m u:www-data:rwx -m u:ubuntu:rwx #{folder}
                            chown -R www-data:www-data #{folder}
                            EOH
        end
    end

    # Create parameters.yml
    template "#{deploy[:deploy_to]}/current/app/config/parameters.yml" do
        source              "parameters.yml.erb"
        mode                0644
        group               "root"
        owner               "#{deploy[:user]}"
        variables(
            :parameters =>  node[:deploy][application.to_s][:environment_variables],
            :application => application
        )
        only_if { ::File.directory? "#{deploy[:deploy_to]}/current/app/config" }
    end

    # Install Composer
    script "install_composer" do
        interpreter         "bash"
        user                "root"
        cwd                 "#{deploy[:deploy_to]}/current"
        code                <<-EOH
                            curl -s https://getcomposer.org/installer | php
                            php composer.phar install --no-interaction --optimize-autoloader
                            EOH
        only_if { ::File.exists?("#{deploy[:deploy_to]}/current/composer.json") }
    end

    node[:custom_env][application.to_s]["symfony_cl"].each do |command|
        execute "symfony_cl_v2" do
            user            "root"
            cwd             "#{deploy[:deploy_to]}/current"
            command         "php app/console #{command}"
            action          :run
            only_if { ::File.exists?("#{deploy[:deploy_to]}/current/app/console") }
        end

        execute "symfony_cl_v3" do
            user            "root"
            cwd             "#{deploy[:deploy_to]}/current"
            command         "php bin/console #{command}"
            action          :run
            only_if { ::File.exists?("#{deploy[:deploy_to]}/current/bin/console") }
        end
    end
end
