#
# Cookbook Name:: ant
# Recipe:: default
#
# Copyright 2015, jf-orange
#
# All rights reserved - Do Not Redistribute
#

ant_home = node['ant']['home']

# ファイル取得
remote_file "/tmp/ant.tar.gz" do
  source node['ant']['url']
  checksum node['ant']['checksum']
end

# 取得したファイルを解凍し移動
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

# 環境変数の設定
template "/etc/profile.d/ant_home.sh" do
  mode 0755
  source "ant_home.sh.erb"
  variables(:ant_home => node['ant']['home'])
end
