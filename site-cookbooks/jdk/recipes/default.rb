#
# Cookbook Name:: jdk
# Recipe:: default
#
# Copyright 2015, jf-orange
#
# All rights reserved - Do Not Redistribute
#

# JDKインストール
#case node['platform_family']
#when 'debian'
#  package 'openjdk-7-jdk'
#when 'rhel'
#  package 'java-1.7.0-openjdk'
#else
#  fail "`#{node['platform_family']}' is not supported!"
#end

jdk_home = node['jdk']['home']
jdk_tmp = node['jdk']['tmp']

# tarファイル転送
cookbook_file node['jdk']['file']  do
  not_if { File.exists?(jdk_tmp) }
  path jdk_tmp
end

# tarファイル解凍
script "install_jdk" do
  not_if { File.exists?("#{jdk_home}/bin/java") }
  interpreter "bash"
  user "root"
  code <<-EOL
    tar xvf #{jdk_tmp}
    mv -f /jdk* #{jdk_home}
  EOL
end

# 既存のjavaのシンボリックリンクがあれば削除
file node['jdk']['java_path'] do
  only_if { File.exists?(node['jdk']['java_path']) }
  action :delete
end

# 既存のjavacのシンボリックリンクがあれば削除
file node['jdk']['javac_path'] do
  only_if { File.exists?(node['jdk']['javac_path']) }
  action :delete
end

# javaのシンボリックリンク作成
link node['jdk']['java_path'] do
  to "#{jdk_home}/bin/java"
end

# javacのシンボリックリンク作成
link node['jdk']['javac_path'] do
  to "#{jdk_home}/bin/javac"
end

# JAVA_HOME環境変数を設定
cookbook_file "profile-java.sh" do
  path "/etc/profile.d/java.sh"
end
