#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2015, Slowhand
#
# All rights reserved - Do Not Redistribute
#

# 既存のrubyがインストールされていたら削除する
package "ruby" do
  only_if 'which ruby'
  action :remove
end

recvkeys = node['rvm']['recvkeys']

# rvmインストール
script "install_rvm" do
  not_if 'which rvm'
  interpreter "bash"
  user node['rvm']['usr']
  environment 'HOME' => node['rvm']['usr_home']
  code <<-EOL
    gpg --keyserver hkp://keys.gnupg.net --recv-keys #{recvkeys}
    curl -L https://get.rvm.io | bash -s stable
  EOL
end

install_ver = node['rvm']['install_ruby_ver']

# rubyインストール
script "install_ruby" do
  interpreter "bash"
  user node['rvm']['usr']
  environment 'HOME' => node['rvm']['usr_home']
  code <<-EOL
    source ~/.profile
    rvm install #{install_ver}
  EOL
end
