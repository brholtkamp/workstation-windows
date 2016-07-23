#
# Cookbook Name:: workstation-windows
# Recipe:: install_visual_studio
#

%w(visualstudio2015community resharper).each do |package|
  chocolatey_package package do
    timeout 7200 # Set the timeout high so the installs can complete
    ignore_failure true # Bug with the end of VisualStudio2015Community: undefined method chomp for nil:NilClass
  end
end

node['workstation']['visual_studio']['extensions'].each do |file, url|
  # Check to see if the file is already installed
  next unless Dir.glob("#{node['workstation']['visual_studio']['extension_dir']}/**/#{file}.*").empty?

  # Download the extension
  remote_file "#{ENV['TEMP']}/#{file}.vsix" do
    source url
    action :create
  end

  # Install the extension
  execute "VSIXInstaller.exe /q #{ENV['TEMP']}/#{file}.vsix" do
    cwd node['workstation']['visual_studio']['vsix_installer_dir']
  end

  # Clean up the download
  file "#{ENV['TEMP']}/#{file}.vsix" do
    action :delete
  end
end
