#
# Cookbook Name:: workstation-windows
# Recipe:: default
#
# Copyright (c) 2016 Brian Holtkamp, All Rights Reserved.

# Added this in order to remove the seven-zip call everytime it's run

::Chef::Recipe.send(:include, Chocolatey::Helpers)

include_recipe 'chocolatey::default' unless chocolatey_installed?
include_recipe 'mingw::default' unless ::File.directory?(node['workstation']['msys'])

windows_package 'Chef Development Kit' do
  source 'https://packages.chef.io/stable/windows/2008r2/chefdk-0.15.15-1-x86.msi'
  not_if { ::File.directory?('C:/opscode/') }
end

# TODO: Fix this when the package is updated on Chocolatey
#chocolatey_package 'chefdk' do
#  action :install
#  ignore_failure true
#end

# Install a baseline set of packages to make MSYS2 useful
%w(git tig man vim python ruby zsh make).each do |package|
  msys2_package package do
    action :install
    root node['workstation']['msys']
  end
end

# Setup MSYS2
windows_font 'Terminus.ttf'
windows_font 'TerminusBold.ttf'
windows_font 'TerminusItalic.ttf'
windows_font 'TerminusBoldItalic.ttf'

cookbook_file "#{node['workstation']['home']}/.minttyrc"

%w(mingw32.ini mingw64.ini msys2.ini).each do |file|
  cookbook_file "#{node['workstation']['msys']}/#{file}"
end

# Setup the MSYS2 customizations
node['workstation']['dotfiles'].each do |file|
  cookbook_file "#{node['workstation']['home']}/#{file}" do
    cookbook 'workstation-common'
  end
end
