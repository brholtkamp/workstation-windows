default['workstation']['msys'] = 'C:/msys64/'
default['workstation']['user'] = "#{ENV['username']}"
default['workstation']['home'] = "#{node['workstation']['msys']}/home/#{node['workstation']['user']}/"
