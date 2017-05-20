class nifi::params {

  $version         = '1.2.0'

  $mirror_url      = 'http://apache.rediris.es'
  $install_dir     = '/opt/nifi'
  $download_dir    = '/var/tmp/nifi'
  $log_dir         = '/var/log/nifi'
  $pid_dir         = '/var/run/nifi'

  $nifi_user       = 'nifi'
  $nifi_uid        = undef
  $nifi_group      = 'nifi'
  $nifi_gid        = undef

  $service_install = true
  $service_name    = 'nifi'
  $service_ensure  = 'running'

  $package_name    = undef
  $package_ensure  = installed

  $default_core_properties = {
    'nifi.flow.configuration.file'                    => './conf/flow.xml.gz',
    'nifi.flow.configuration.archive.enabled'         => true,
    'nifi.flow.configuration.archive.dir'             => './conf/archive/',
    'nifi.flow.configuration.archive.max.time'        => '30 days',
    'nifi.flow.configuration.archive.max.storage'     => '500 MB',
    'nifi.flowcontroller.autoResumeState'             => true,
    'nifi.flowcontroller.graceful.shutdown.period'    => '10 sec',
    'nifi.flowservice.writedelay.interval'            => '500 MB',
    'nifi.administrative.yield.duration'              => '30 sec',
    'nifi.bored.yield.duration'                       => '10 millis',
    'nifi.authorizer.configuration.file'              => './conf/authorizers.xml',
    'nifi.login.identity.provider.configuration.file' => './conf/login-identity-providers.xml',
    'nifi.templates.directory'                        => './conf/templates',
    'nifi.ui.autorefresh.interval'                    => '30 sec',
    'nifi.nar.library.directory'                      => './lib',
    'nifi.nar.working.directory'                      => './work/nar/',
    'nifi.documentation.working.directory'            => './work/docs/components',
  }

  $default_stage_management = {
    'nifi.state.management.configuration.file'       => './conf/state-management.xml',
    'nifi.state.management.provider.local'           => 'local-provider',
    'nifi.state.management.provider.cluster'         => 'zk-provider',
    'nifi.state.management.embedded.zookeeper.start' => false,
  }

  $default_h2_settings = {
    'nifi.database.directory' => './database_repository',
    'nifi.h2.url.append'      => ';LOCK_TIMEOUT=25000;WRITE_DELAY=0;AUTO_SERVER=FALSE',
  }

}

