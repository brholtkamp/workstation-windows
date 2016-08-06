require 'spec_helper'

describe 'workstation-windows::install_unity' do
  describe file('C:/Program Files/Unity') do
    it { should be_directory }
  end

  describe file('C:/Program Files (x86)/Microsoft Visual Studio Tools for Unity') do
    it { should be_directory }
  end
end
