require 'spec_helper'

describe command(". C:\\Users\\#{ENV['username']}\\Documents\\WindowsPowerShell\\profile.ps1; gem list") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /test-kitchen/ }
  its(:stdout) { should match /kitchen-vagrant/ }
  its(:stdout) { should match /winrm/ }
end

describe command(". C:\\Users\\#{ENV['username']}\\Documents\\WindowsPowerShell\\profile.ps1; kitchen") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /Test Kitchen/ }
end
