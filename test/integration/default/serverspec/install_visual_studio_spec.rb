require 'spec_helper'

describe 'workstation-windows::install_visual_studio' do
  describe file('C:/Program Files (x86)/Microsoft Visual Studio 14.0/') do
    it { should be_directory }
  end

  describe file('C:/Users/vagrant/AppData/Local/Microsoft/VisualStudio/14.0/Extensions/**/VsVim.dll') do
    it { should exist }
  end

  describe file('C:/VsVim.vsix') do
    it { should_not exist }
  end
end
