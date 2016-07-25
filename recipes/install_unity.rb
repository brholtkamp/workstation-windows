#
# Cookbook Name:: workstation-windows
# Recipe:: install_unity
#

chocolatey_package 'unity' do
  options '-i' # Removes the dotnet3.5 dependency
end

package 'Visual Studio Tools for Unity 2015' do
  source 'https://visualstudiogallery.msdn.microsoft.com/8d26236e-4a64-4d64-8486-7df95156aba9/file/142077/10/vstu2015.msi'
  not_if { Dir.exist?("#{ENV['ProgramFiles(x86)']}/Microsoft Visual Studio Tools for Unity/") }
end
