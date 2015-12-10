#
# Cookbook Name:: observium
# Recipe:: observium_cron
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


cron_d 'discover_all' do
  minute 33
  hour '*/6'
  command '/opt/observium/discovery.php -h all >> /dev/null 2>&1'
  user 'root'
end

cron_d 'discover_new' do
  minute '*/5'
  command '/opt/observium/discovery.php -h new >> /dev/null 2>&1'
  user 'root'
end

cron_d 'poller' do
  minute '*/5'
  command '/opt/observium/poller-wrapper.py 2 >> /dev/null 2>&1'
  user 'root'
end
