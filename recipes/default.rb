#
# Cookbook Name:: workstation-windows
# Recipe:: default
#
# Copyright (c) 2016 Brian Holtkamp, All Rights Reserved.

include_recipe 'chocolatey'
include_recipe 'mingw'
include_recipe 'workstation-windows::install_terminus_font'

chocolatey 'chefdk'

%w{git tig man vim python ruby zsh make}.each do |gem|
  msys2_package gem do
    action :upgrade
    root 'C:\msys64'
  end
end
