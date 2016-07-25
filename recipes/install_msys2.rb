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

# Install Windows exclusive dotfiles; workstation-common does normal dotfiles
%w(minttyrc zshrc.windows).each do |file|
  cookbook_file "#{node['workstation']['home']}/.#{file}" do
    source file
  end
end

# Make ZSH the main shell on launch
%w(mingw32.ini mingw64.ini msys2.ini).each do |file|
  cookbook_file "#{node['msys2']['install_dir']}/#{file}"
end

# Install common packages
node['workstation']['packages'].each do |package|
  msys2_package package
end
