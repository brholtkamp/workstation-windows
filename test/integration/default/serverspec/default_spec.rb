require 'spec_helper'

describe command('kitchen') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/Test Kitchen/) }
end
