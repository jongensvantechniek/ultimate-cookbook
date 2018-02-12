script "acl_setup" do
  interpreter "bash"
  user "root"
  cwd "/"
  code <<-EOH
  apt-get install acl
  EOH
end
