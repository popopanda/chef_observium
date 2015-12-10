#
# Cookbook Name:: observium
# Recipe:: selinux_permissive
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
selinux_state "SELinux Permissive" do
  action :permissive
end
