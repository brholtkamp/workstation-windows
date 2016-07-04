#
# Cookbook Name:: workstation-windows
# Recipe:: setup_test_environment
#
# Copyright (c) 2016 Brian Holtkamp, All Rights Reserved.

include_recipe 'mingw::default'

# Add in all necessary MSYS packages to run test-kitchen
%w{make mingw-w64-x86_64-ruby mingw-w64-x86_64-gcc mingw-w64-x86_64-make}.each do |package|
  msys2_package package do
    action :upgrade
    root 'C:/msys64/'
  end
end

# Install all necessary gems inside of mingw64 and compile the native ones
%w{test-kitchen kitchen-vagrant winrm win32-process}.each do |gem|
  msys2_execute "installing gem: #{gem}" do
    command "gem install #{gem} --no-user-install --platform ruby"
    root 'C:/msys64/'
    shell :mingw64
  end
end

# Create a PowerShell profile in order to setup proper paths for test-kitchen
directory 'creating PowerShell directory' do
  action :create
  path "C:/Users/#{ENV['username']}/Documents/WindowsPowerShell/"
  recursive true
end

file 'creating PowerShell profile' do
  action :touch
  path "C:/Users/#{ENV['username']}/Documents/WindowsPowerShell/profile.ps1"
end

# Append in all the appropriate paths into the new profile
[['PATH', '"C:\msys64\mingw64\bin;" + $env:Path'], ['GEM_PATH', '"C:\msys64\mingw64\lib\ruby\gems\2.3.0"'], ['GEM_HOME', '"C:\msys64\mingw64\lib\ruby\gems\2.3.0"']].each do |var, value|
  # Add the environmental variables into the registry
  powershell_script 'setting PowerShell environmental variable' do
    code "[System.Environment]::SetEnvironmentVariable(\"#{var}\", #{value}, \"Machine\"); $env:#{var} = #{value}"
  end

  # Add them into the profile in order to run the test without rebooting
  ruby_block 'updating PowerShell profile' do
    block do
      file = Chef::Util::FileEdit.new("C:/Users/#{ENV['username']}/Documents/WindowsPowerShell/profile.ps1")
      file.insert_line_if_no_match(/#{var}/, "$env:#{var} = #{value}")
      file.write_file
    end
  end
end

