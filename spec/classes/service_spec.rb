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

  let :common_params do
    {
      version: '1.2.0'
    }
  end

  context 'on RedHat' do
    describe 'nifi::service' do
      context 'service_install false' do
        let :params do
          common_params.merge(service_install: false)
	end

	it { is_expected.not_to contain_exec('systemctl-daemon-reload-nifi') }

	it { is_expected.not_to contain_file('nifi.service') }
	
	it { is_expected.not_to contain_service('nifi') }
	
	it { is_expected.not_to contain_file('/etc/init.d/nifi') }
      end

      context 'default' do

	it { is_expected.to contain_file('nifi.service').that_notifies('Exec[systemctl-daemon-reload-nifi]') }
	it { is_expected.to contain_exec('systemctl-daemon-reload-nifi').that_comes_before('Service[nifi]') }

	it do
	  is_expected.to contain_exec('systemctl-daemon-reload-nifi').with(
            'command'     => 'systemctl daemon-reload',
	    'refreshonly' => 'true',
	    'path'        => '/usr/bin',
	  )
	end

	it do
          is_expected.to contain_file('nifi.service').with(
            'ensure' => 'file',
	    'path'   => '/etc/systemd/system/nifi.service',
	    'mode'   => '0644',
	  )
	end

	it do
	  is_expected.to contain_file('/etc/init.d/nifi').with(
            ensure: 'absent'
	  )
	end

        it do
          is_expected.to contain_service('nifi').with(
	    'ensure'     => 'running',
	    'enable'     => 'true',
	    'hasstatus'  => 'true',
	    'hasrestart' => 'true',
	  )
	end
      end
    end
  end
end
