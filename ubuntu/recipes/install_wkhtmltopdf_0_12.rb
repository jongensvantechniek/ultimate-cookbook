script "install_wkhtmltopdf_0_12" do
    interpreter         "bash"
    user                "root"
    code                <<-EOH
                        add-apt-repository ppa:ecometrica/servers -y
                        apt-get update
                        apt-get install wkhtmltopdf -y
                        apt-get install xvfb -y
                        echo 'xvfb-run -a -s "-screen 0 640x480x16" wkhtmltopdf "$@"' | tee /usr/bin/wkhtmltopdf.sh
                        chmod a+x /usr/bin/wkhtmltopdf.sh
                        EOH
    not_if { ::File.exists?("/usr/bin/wkhtmltopdf.sh") }
end
