#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

jenkins_yum = node['jenkins']['yum']
jenkins_url = node['jenkins']['url']
jenkins_key = node['jenkins']['key']

# リポジトリの追加
script "add_repo" do
  interpreter "bash"
  user "root"
  code <<-EOL
    wget -O "#{jenkins_yum}" "#{jenkins_url}"
    rpm --import "#{jenkins_key}"
  EOL
end

# インストール
package "jenkins" do
  action :install
end

# 環境変数の設定
template "/etc/sysconfig/jenkins" do
  mode 0600
  source "jenkins.erb"
  variables(:port => node['jenkins']['port'])
end

# 起動
service "jenkins" do
    action [ :enable, :start ]
end

# iptablesの無効化
service "iptables" do
    action [ :disable, :stop]
end
