#
# Cookbook Name:: workstation-windows
# Recipe:: default
#

include_recipe 'workstation-windows::install_chocolatey'
include_recipe 'workstation-windows::install_msys2'

# Make sure ChefDK is installed
chocolatey_package 'chefdk' do
  action :install
  ignore_failure true # Added due to the output done by Chocolatey
end

# Run workstation-common's default
include_recipe 'workstation-common::default'
