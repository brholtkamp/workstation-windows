#
# Cookbook Name:: workstation-windows
# Recipe:: install_chocolatey
#

# Added this in order to remove the seven-zip call everytime it's run
Chef::Recipe.send(:include, Chocolatey::Helpers)
include_recipe 'chocolatey::default' unless chocolatey_installed?

# Make sure ChefDK is installed
chocolatey_package 'chefdk' do
  action :install
  ignore_failure true
end
