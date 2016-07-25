#
# Cookbook Name:: workstation-windows
# Recipe:: install_applications
#

include_recipe 'workstation-windows::install_chocolatey'

node['workstation']['applications'].each do |app|
  chocolatey_package app
end
