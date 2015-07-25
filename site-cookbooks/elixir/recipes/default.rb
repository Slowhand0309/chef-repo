#
# Cookbook Name:: elixir
# Recipe:: default
#
# Copyright 2015, Slowhand
#
# All rights reserved - Slowhand
#

# install erlang
node.set[:erlang][:install_method]    = "source"
node.set[:erlang][:source][:version]  = "18.0"
node.set[:erlang][:source][:url]      = "http://erlang.org/download/otp_src_#{node[:erlang][:source][:version]}.tar.gz"
node.set[:erlang][:source][:checksum] = "a0b69da34b4f218eb7d63d9e96fc120aa7257bb6c37a0f40fb388e188b4111aa"

include_recipe "erlang::default"
include_recipe "git::default"

# create directory
directory node[:elixir][:home] do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

# git clone to specified dir
git "elixir" do
  repository node[:elixir][:repo]
  revision "v#{node[:elixir][:version]}"
  destination node[:elixir][:source][:path]
  action :sync
end

# make
bash "make" do
  cwd node[:elixir][:source][:path]
  code "make"
  action :run
end

# create symbolic link
link node[:elixir][:link] do
  to "#{node[:elixir][:source][:path]}/bin"
end

# setting PATH environment variable
template "/etc/profile.d/elixir.sh" do
  mode 0755
  source "elixir.sh.erb"
  variables(:elixir_home => node[:elixir][:home])
end
