#
# Cookbook Name:: observium
# Recipe:: config_observium
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

template "#{node['observium']['directory']['install_dir']}/config.php" do
  source 'config.php.erb'
  variables(
    :username => node['observium']['database']['user']['name'],
    :password => node['observium']['mysql']['observium']['password'],
    :db_name => node['observium']['database']['mysql']['name'],
    :contact => node['observium']['alert']['email']
    )
    notifies :run, 'execute[php_update_db]', :immediately
    notifies :run, 'execute[create_user]', :delayed
end

directory "#{node['observium']['directory']['install_dir']}/logs" do
  if node['platform_family'] == 'rhel'
    owner node['observium']['log']['rhel']['owner']
    group node['observium']['log']['rhel']['group']
  end
  action :create
end

directory "#{node['observium']['directory']['install_dir']}/rrd" do
  if node['platform_family'] == 'debian'
    owner node['observium']['rrd']['debian']['owner']
    group node['observium']['rrd']['debian']['group']
  elsif node['platform_family'] == 'rhel'
    owner node['observium']['rrd']['rhel']['owner']
    group node['observium']['rrd']['rhel']['group']
  end
  action :create
end

if node['platform_family'] == 'rhel'
  template "#{node['observium']['rhel']['apache']['dir']}/httpd.conf" do
    source 'httpd.conf.erb'
    variables(
    :document_dir => node['observium']['html']['dir'],
    :errorlog => node['observium']['logs']['dir']
    )
  end
elsif node['platform_family'] == 'debian'
  #debian stuff
end

execute 'create_user' do
  command ".#{node['observium']['directory']['install_dir']}/adduser.php #{node['observium']['login']['username']} #{node['observium']['login']['password']} 10"
  action :nothing
end

execute 'php_update_db' do
  command "php #{node['observium']['directory']['install_dir']}/includes/update/update.php"
  cwd "#{node['observium']['directory']['install_dir']}"
  action :nothing
end

service node['observium']['service']['httpd'] do
  action [:enable, :start]
end
