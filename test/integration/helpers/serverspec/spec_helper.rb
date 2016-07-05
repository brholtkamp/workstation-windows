require 'serverspec'

if ENV['OS'] == 'Windows_NT'
  set :backend, :cmd
  set :os, :family => 'windows'
else
  set :backend, :exec
end
