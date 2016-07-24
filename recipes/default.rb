#
# Cookbook Name:: workstation-windows
# Recipe:: default
#

include_recipe 'workstation-windows::install_chocolatey'
include_recipe 'workstation-windows::install_msys2'
include_recipe 'workstation-windows::install_visual_studio'

include_recipe 'workstation-common::default'
