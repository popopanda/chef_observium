#
# Cookbook Name:: observium
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

mysql2_chef_gem node['observium']['mysql']['gem'] do
  action :install
end

mysql_client node['observium']['mysql']['client'] do
  action :create
end

mysql_service node['observium']['mysql']['service'] do
  initial_root_password node['observium']['mysql']['root']['password']
  action [:create, :start]
end

mysql_database node['observium']['database']['mysql']['name'] do
  connection(
  :host => '127.0.0.1',
  :username => 'root',
  :password => node['observium']['mysql']['root']['password']
  )
  action :create
end

mysql_database_user node['observium']['database']['user']['name'] do
  connection(
  :host => '127.0.0.1',
  :username => 'root',
  :password => node['observium']['mysql']['root']['password']
  )
  password node['observium']['mysql']['observium']['password']
  database_name node['observium']['database']['mysql']['name']
  privileges [:all]
  action :grant
end
