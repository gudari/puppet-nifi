require 'spec_helper'

describe 'nifi', type: :class  do
  let :facts do
    {
      osfamily: 'RedHat',
      os: { family: 'RedHat' },
      operatingsystem: 'CentOS',
      operatingsystemrelease: '7.3.1611',
      architecture: 'x86_64',
      service_provider: 'systemd'
    }
  end

  it { is_expected.to contain_class('nifi::params') }

  context 'on RedHat' do
    describe 'nifi' do
      context 'defaults' do
	it { is_expected.to contain_class('nifi') }
        it { is_expected.to contain_group('nifi') }
        it { is_expected.to contain_user('nifi') }

        it { is_expected.to contain_anchor('::nifi::start') }
        it { is_expected.to contain_class('nifi::install') }
        it { is_expected.to contain_class('nifi::config') }
        it { is_expected.to contain_class('nifi::service') }
        it { is_expected.to contain_anchor('::nifi::end') }

        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end
