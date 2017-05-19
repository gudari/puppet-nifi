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
        it { is_expected.to contain_group('nifi') }
        it { is_expected.to contain_user('nifi') }

        it { is_expected.to contain_archive('/var/tmp/nifi/nifi-1.2.0-bin.tar.gz') }
        it { is_expected.to contain_exec('systemctl-daemon-reload-nifi') }
        it { is_expected.to contain_file('/etc/init.d/nifi') }
        it { is_expected.to contain_file('/opt/nifi-1.2.0') }
        it { is_expected.to contain_file('/opt/nifi/bin/nifi-env.sh') }
        it { is_expected.to contain_file('/opt/nifi/conf/authorizers.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/bootstrap-notification-services.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/bootstrap.conf') }
        it { is_expected.to contain_file('/opt/nifi/conf/logback.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/login-identity-providers.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/nifi.properties') }
        it { is_expected.to contain_file('/opt/nifi/conf/state-management.xml') }
        it { is_expected.to contain_file('/opt/nifi/conf/zookeeper.properties') }
        it { is_expected.to contain_file('/opt/nifi/conf') }
        it { is_expected.to contain_file('/opt/nifi') }
        it { is_expected.to contain_file('/var/log/nifi') }
        it { is_expected.to contain_file('/var/run/nifi') }
        it { is_expected.to contain_file('/var/tmp/nifi') }
        it { is_expected.to contain_file('nifi.service') }
        it { is_expected.to contain_service('nifi') }

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
