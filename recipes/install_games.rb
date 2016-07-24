#
# Cookbook Name:: workstation-windows
# Recipe:: install_games
#

node['workstation']['games'].each do |app|
  chocolatey_package app
end
