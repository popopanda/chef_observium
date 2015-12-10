#
# Cookbook Name:: observium
# Recipe:: observium
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# directory "#{node['observium']['directory']['path']}" do
#   mode node['observium']['directory']['chmod']
#   action :create
#   notifies :create, "remote_file[#{node['observium']['directory']['path']}/observium-community-latest.tar.gz]", :immediately
# end

execute 'untar_observium' do
  command "tar zxf #{node['observium']['directory']['path']}/observium-community-latest.tar.gz"
  cwd '/opt/'
  action :nothing
  notifies :run, 'execute[cp_default_config]', :immediately
end

remote_file "#{node['observium']['directory']['path']}/observium-community-latest.tar.gz" do
  source node['observium']['package']['url']
  action :create
  notifies :run, 'execute[untar_observium]', :immediately
end

execute 'cp_default_config' do
  command "cp /opt/observium/config.php.default /opt/observium/config.php"
  action :nothing
end
