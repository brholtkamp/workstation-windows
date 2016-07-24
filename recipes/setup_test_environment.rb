#
# Cookbook Name:: workstation-windows
# Recipe:: setup_test_environment
#

%w(vagrant packer virtualbox).each do |package|
  chocolatey_package package
end

%w(vagrant-winrm).each do |plugin|
  vagrant_plugin plugin
end
