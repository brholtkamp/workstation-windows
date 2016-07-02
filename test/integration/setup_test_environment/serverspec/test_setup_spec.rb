require 'spec_helper'

describe 'workstation_windows::setup_test_environment' do
  describe command('cmd.exe /C C:\tools\ruby23\bin\gem list') do
    its(:stdout) { should match /'test-kitchen'/ }
    its(:stdout) { should match /'kitchen-vagrant'/ }
    its(:stdout) { should match /'winrm'/ }
  end

#  describe package('test-kitchen') do
#    it { should be_installed.by('gem') }
#  end
#
#  describe package('kitchen-vagrant') do
#    it { should be_installed.by('gem') }
#  end
#
#  describe package('winrm') do
#    it { should be_installed.by('gem') }
#  end
end
