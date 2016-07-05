#
# Cookbook Name:: workstation-windows
# Recipe:: default
#
# Copyright (c) 2016 Brian Holtkamp, All Rights Reserved.

include_recipe 'chocolatey'
include_recipe 'mingw'

windows_package 'Chef Development Kit' do
  source 'https://packages.chef.io/stable/windows/2008r2/chefdk-0.15.15-1-x86.msi'
end

# TODO: Fix this when the package is updated on Chocolatey
#chocolatey_package 'chefdk' do
#  action :install
#  ignore_failure true
#end

%w{git tig man vim python ruby zsh make}.each do |package|
  msys2_package package do
    action :upgrade
    root node['workstation']['msys']
  end
end

windows_font 'Terminus.ttf'
