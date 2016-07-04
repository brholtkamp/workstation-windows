#
# Cookbook Name:: workstation-windows
# Recipe:: fonts
#
# Copyright (c) 2016 Brian Holtkamp, All Rights Reserved.

windows_zipfile 'C:/terminus' do
  action :unzip
  source 'http://files.ax86.net/terminus-ttf/files/latest-windows.zip'
  overwrite true
  not_if { !Dir.glob('C:/Windows/Fonts/*Terminus*.*').empty? }
end

Dir.glob('C:/terminus/**/*.ttf') do |font|
  windows_font File.basename(font) do
    source font
  end
end
