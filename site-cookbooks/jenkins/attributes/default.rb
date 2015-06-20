#
# Cookbook Name:: jenkins
# Attributes:: default

default['jenkins']['port'] = 8081
default['jenkins']['yum'] = '/etc/yum.repos.d/jenkins.repo'
default['jenkins']['url'] = 'http://pkg.jenkins-ci.org/redhat/jenkins.repo'
default['jenkins']['key'] = 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
