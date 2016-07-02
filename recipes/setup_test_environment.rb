#
# Cookbook Name:: workstation_windows
# Recipe:: setup_test_environment
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chocolatey'

chocolatey 'ruby' do
  action :install
end

%w{test-kitchen kitchen-vagrant winrm serverspec}.each do |gem|
  gem_package gem do
    action :upgrade
    gem_binary 'C:\tools\ruby23\bin\gem'
  end
end
