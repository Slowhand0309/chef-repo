#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2015, Slowhand
#
# All rights reserved - Do Not Redistribute
#

base_url = node['rails']['nginx_repo_url']

# yumリポジトリに登録
script "add_repo" do
  not_if 'which nginx'
  interpreter "bash"
  user "root"
  code <<-EOL
    rpm -ivh #{base_url}
  EOL
end

# nginxインストール
package "nginx" do
  action :install
end

# sqliteインストール
package "sqlite-devel" do
  action :install
end
