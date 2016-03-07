require 'spec_helper'

describe 'git' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "git class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('git::params') }
          it { is_expected.to contain_class('git::install').that_comes_before('git::config') }
          it { is_expected.to contain_class('git::config') }
          it { is_expected.to contain_class('git::service').that_subscribes_to('git::config') }

          it { is_expected.to contain_service('git') }
          it { is_expected.to contain_package('git').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'git class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('git') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
