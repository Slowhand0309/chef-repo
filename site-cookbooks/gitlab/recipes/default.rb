#
# Cookbook Name:: gitlab
# Recipe:: default
#
# Copyright 2015, jf-orange
#
# All rights reserved - Do Not Redistribute
#

gitlab_url = node['gitlab']['url']
gitlab_rpm = node['gitlab']['rpm']

# openssh-server インストール
package "openssh-server" do
  action :install
end

# postfix インストール
package "postfix" do
  action :install
end

# gitlab インストール
remote_file "/tmp/#{gitlab_rpm}" do
  source "#{gitlab_url}"
end

rpm_package "gitlab_rpm_package" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{gitlab_rpm}"
end

#script "install_gitlab" do
#  interpreter "bash"
#  user "root"
#  code <<-EOL
#    wget "#{gitlab_url}"
#    rpm -i "#{gitlab_rpm}"
#  EOL
#end

# 設定ファイル修正
template "/etc/gitlab/gitlab.rb" do
  mode 0755
  source "gitlab.rb.erb"
  variables(:external_url => node['gitlab']['external_url'])
end

# 起動
script "launch_gitlab" do
  interpreter "bash"
  user "root"
  code <<-EOL
    gitlab-ctl reconfigure
    lokkit -s http -s ssh
    gitlab-ctl start
  EOL
end
