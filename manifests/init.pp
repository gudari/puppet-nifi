# Class: nifi
# ===========================
#
# Full description of class nifi here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'nifi':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class nifi (

  $version                    = $nifi::params::version,

  $install_dir                = $nifi::params::install_dir,
  $extract_dir                = "/opt/nifi-${version}",
  $download_dir               = $nifi::params::download_dir,
  $mirror_url                 = $nifi::params::mirror_url,
  $basefilename               = "nifi-${version}-bin.tar.gz",
  $package_url                = "${mirror_url}/nifi/${version}/${basefilename}",
  $log_dir                    = $nifi::params::log_dir,
  $pid_dir                    = $nifi::params::pid_dir,

  $config_dir                 = "${install_dir}/conf",

  $custom_properties       = {},
  $custom_state_management = {},
  $custom_authorizers      = {},
  $custom_bootstrap        = $nifi::params::java_args,


  $service_install            = $nifi::params::service_install,
  $service_name               = $nifi::params::service_name,
  $service_ensure             = $nifi::params::service_ensure,

  $nifi_group                 = $nifi::params::nifi_group,
  $nifi_gid                   = $nifi::params::nifi_gid,
  $nifi_user                  = $nifi::params::nifi_user,
  $nifi_uid                   = $nifi::params::nifi_uid,

  $package_name    = $nifi::params::package_name,
  $package_ensure  = $nifi::params::package_ensure,

) inherits nifi::params {

  group { $nifi_group:
    ensure => present,
    gid    => $nifi_gid,
  }

  user { $nifi_user:
    ensure  => present,
    uid     => $nifi_uid,
    groups  => $nifi_group,
    require => Group[ $nifi_group ],
  }

  $properties       = deep_merge($nifi::params::default_properties, $custom_properties)
  $state_management = deep_merge($nifi::params::default_state_management, $custom_state_management)
  $bootstrap        = deep_merge($nifi::params::default_bootstrap, $custom_bootstrap)

  anchor { '::nifi::start': } -> class { '::nifi::install': } -> class { '::nifi::config': } ~> class { '::nifi::service': } -> anchor { '::nifi::end': }
}

