#
# Cookbook Name:: observium
# Recipe:: set_repo
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

case node['platform_family']
when 'rhel'
  package node['observium']['yum']['epel']
  package node['observium']['yum']['packages']
when 'debian'
  package node['observium']['apt']['packages']
end
