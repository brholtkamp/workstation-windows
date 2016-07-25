#
# Cookbook Name:: workstation-windows
# Recipe:: setup_test_environment
#

include_recipe 'workstation-windows::default'

%w(vagrant packer virtualbox).each do |package|
  chocolatey_package package
end

# Make sure vagrant is in the path
unless ENV['PATH'] =~ /vagrant/
  ENV['PATH'] = "#{ENV['PATH']};C:/Hashicorp/Vagrant/bin"
end

%w(vagrant-winrm).each do |plugin|
  vagrant_plugin plugin
end
