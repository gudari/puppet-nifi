class nifi::config {

  file { "${nifi::config_dir}/authorizers.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/authorizers.xml'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/bootstrap-notification-services.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/bootstrap-notification-services.xml'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/login-identity-providers.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/login-identity-providers.xml'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/state-management.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => template('nifi/config/state-management.xml.erb'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/bootstrap.conf":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/bootstrap.conf'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/logback.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/logback.xml'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/nifi.properties":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => template('nifi/config/nifi.properties.erb'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::config_dir}/zookeeper.properties":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/zookeeper.properties'),
    require => File[ $nifi::config_dir ],
  }

  file { "${nifi::install_dir}/bin/nifi-env.sh":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    mode    => '0750',
    content => template('nifi/environment/nifi-env.sh.erb'),
    require => File[ $nifi::install_dir ],
  }

}
