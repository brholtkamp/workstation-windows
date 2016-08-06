require 'spec_helper'

describe 'workstation-windows::setup_test_environment' do
  describe command('vagrant --version') do
    its(:stdout) { should match /Vagrant [0-9.]+/ }
  end

  describe command('packer --version') do
    its(:stdout) { should match /[0-9.]+/ }
  end

  describe file('C:/Program Files/Oracle/VirtualBox') do
    it { should be_directory }
  end
end
