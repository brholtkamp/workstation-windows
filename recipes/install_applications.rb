#
# Cookbook Name:: workstation-windows
# Recipe:: install_applications
#

node['workstation']['applications'].each do |app|
  chocolatey_package app
end
