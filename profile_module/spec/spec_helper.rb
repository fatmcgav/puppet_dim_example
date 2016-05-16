# This file is managed centrally by modulesync
#   https://github.com/weareact/modulesync_config
require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera'
require 'rspec-puppet'

def fixture_path
    File.join(File.dirname(__FILE__), 'fixtures')
end

# Add fixture lib dirs to LOAD_PATH. Work-around for PUP-3336
#
if Puppet.version < "4.0.0"
  Dir["#{fixture_path}/modules/*/lib"].entries.each do |lib_dir|
    $LOAD_PATH << lib_dir
  end
end

# Facts
require 'rspec-puppet-facts'
include RspecPuppetFacts

RSpec.configure do |c|
  c.before(:each) do
    Puppet::Util::Log.level = :warning
    Puppet::Util::Log.newdestination(:console)
  end

  c.color = true
  c.formatter = :documentation

  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'

  c.default_facts = {
    :kernel                    => 'Linux',
    :operatingsystem           => 'CentOS',
    :operatingsystemrelease    => '6.5',
    :operatingsystemmajrelease => '6',
    :lsbmajdistrelease         => '6',
    :osfamily                  => 'RedHat',
    :architecture              => 'x86_64',
    :concat_basedir            => "/tmp/concat",
    :path                      => '/sbin:/bin:/usr/sbin:/usr/bin'
  }

  c.before do
    # avoid "Only root can execute commands as other users"
    Puppet.features.stubs(:root? => true)
  end

  # Generate Coverage report
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end

shared_examples :compile, :compile => true do
  it { should compile.with_all_deps }
end

