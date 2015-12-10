#
# Cookbook Name:: observium
# Recipe:: firewall_permithttp
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

firewall 'default'

firewall_rule 'http' do
  port     80
  protocol :tcp
  position 1
  command   :allow
end
