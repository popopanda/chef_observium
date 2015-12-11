#
# Cookbook Name:: observium
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'observium::set_repo'
include_recipe 'observium::selinux_permissive'
include_recipe 'observium::observium'
include_recipe 'observium::database'
include_recipe 'observium::config_observium'
include_recipe 'observium::observium_cron'
# include_recipe 'observium::firewall_permithttp'
