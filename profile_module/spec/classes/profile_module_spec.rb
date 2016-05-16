require 'spec_helper'

describe 'profile_module' do

  it { 
    Puppet::Util::Log.level = :debug
    Puppet::Util::Log.newdestination(:console)
    should create_class('profile_module')
    should contain_class('calling_module')
    should contain_class('framework_module')
      .with_template('calling_module/test.txt.erb')

    should contain_file('test').with({
      'ensure'  => 'file',
      'path'    => '/tmp/test.txt',
      'content' => /test/
    })
  }
end

