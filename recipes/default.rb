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

# Install the dotfiles in the MSYS2 environment
include_recipe 'workstation-common::default'

# Sets the chef-client service so it can run as a daemon
include_recipe 'chef-client::default'
