require 'spec_helper'

describe 'nifi', type: :class do
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

  context 'on RedHat' do
    describe 'nifi::install' do
      context 'default' do
        it { is_expected.to contain_archive('/var/tmp/nifi/nifi-1.2.0-bin.tar.gz') }
	it { is_expected.to contain_file('/var/tmp/nifi') }
	it { is_expected.to contain_file('/opt/nifi-1.2.0') }
	it { is_expected.to contain_file('/var/log/nifi') }
	it { is_expected.to contain_file('/var/run/nifi') }
	it { is_expected.to contain_file('/opt/nifi') }
	it { is_expected.to contain_file('/opt/nifi/conf') }
      end
    end
  end
end
