script "install_oracle_java_8" do
    interpreter         "bash"
    user                "root"
    code                <<-EOH
                        add-apt-repository ppa:webupd8team/java -y
                        apt-get update
                        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
                        apt-get install oracle-java8-installer -y
                        EOH
    not_if { ::File.exists?("/usr/bin/java") }
end
