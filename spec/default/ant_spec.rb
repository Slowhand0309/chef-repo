require 'spec_helper'

describe file('/usr/local/ant/bin/ant') do
  it { should be_file }
end
