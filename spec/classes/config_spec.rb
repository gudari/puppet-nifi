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
    describe 'nifi::config' do
      context 'default' do
        it { is_expected.to contain_file('/opt/nifi/bin/nifi-env.sh') }
        it { is_expected.to contain_file('/opt/nifi/conf/authorizers.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/bootstrap-notification-services.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/bootstrap.conf') }
        it { is_expected.to contain_file('/opt/nifi/conf/logback.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/login-identity-providers.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/nifi.properties') }
        it { is_expected.to contain_file('/opt/nifi/conf/state-management.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/zookeeper.properties') }

      end
    end
  end
end
