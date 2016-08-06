require 'spec_helper'

describe 'workstation-windows::default' do
  describe command('choco') do
    its(:stdout) { should match(/Chocolatey/) }
  end

  describe file('C:/msys64/') do
    it { should be_directory }
  end

  describe file('C:/opscode/chefdk') do
    it { should be_directory }
  end

  describe service('chef-client') do
    it { should be_installed }
  end
end
