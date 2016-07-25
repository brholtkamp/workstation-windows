#
# Cookbook Name:: workstation-windows
# Recipe:: install_games
#

include_recipe 'workstation-windows::install_chocolatey'

node['workstation']['games'].each do |app|
  chocolatey_package app
end
