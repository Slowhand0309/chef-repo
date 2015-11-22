#
# Cookbook Name:: ant
# Recipe:: default
#
# Copyright 2015, Slowhand0309
#

ant_home = node['ant']['home']

# get archive file
remote_file "/tmp/ant.tar.gz" do
  source node['ant']['url']
  checksum node['ant']['checksum']
end

# Decompression of files and move
script "install_ant" do
  not_if 'which ant'
  interpreter "bash"
  user "root"
  code <<-EOL
    tar zxvf /tmp/ant.tar.gz
    rm -rf "#{ant_home}"
    mv -f apache-ant-* "#{ant_home}"
  EOL
end

# Setting environment
template "/etc/profile.d/ant_home.sh" do
  mode 0755
  source "ant_home.sh.erb"
  variables(:ant_home => node['ant']['home'])
end
