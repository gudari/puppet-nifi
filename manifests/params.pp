class nifi::params {

  $version        = '1.2.0'

  $mirror_url     = 'http://apache.rediris.es'
  $install_dir    = '/opt/nifi'
  $download_dir   = '/var/tmp/nifi'
  $log_dir        = '/var/log/nifi'
  $pid_dir        = '/var/run/nifi'

  $nifi_user      = 'nifi'
  $nifi_uid       = undef
  $nifi_group     = 'nifi'
  $nifi_gid       = undef

  $package_name   = undef
  $package_ensure = installed
}

