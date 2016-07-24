#
# Cookbook Name:: workstation-windows
# Recipe:: install_msys2
#

include_recipe 'msys2::default'

# Setup MSYS2
windows_font 'Terminus.ttf'
windows_font 'TerminusBold.ttf'
windows_font 'TerminusItalic.ttf'
windows_font 'TerminusBoldItalic.ttf'

cookbook_file "#{node['workstation']['home']}/.minttyrc"
cookbook_file "#{node['workstation']['home']}/.zshrc.windows"

%w(mingw32.ini mingw64.ini msys2.ini).each do |file|
  cookbook_file "#{node['msys2']['install_dir']}/#{file}"
end

# Setup the MSYS2 customizations
node['workstation']['dotfiles'].each do |file|
  cookbook_file "#{node['workstation']['home']}/#{file}" do
    cookbook 'workstation-common'
  end
end

# Install common packages
node['workstation']['packages'].each do |package|
  msys2_package package
end
