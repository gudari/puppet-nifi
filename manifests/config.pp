class nifi::config {

  file { "${nifi::config_dir}/authorizers.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/authorizers.xml'),
  }

  file { "${nifi::config_dir}/bootstrap-notification-services.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/bootstrap-notification-services.xml'),
  }

  file { "${nifi::config_dir}/login-identity-providers.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/login-identity-providers.xml'),
  }

  file { "${nifi::config_dir}/state-management.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/state-management.xml'),
  }

  file { "${nifi::config_dir}/bootstrap.conf":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/bootstrap.conf'),
  }

  file { "${nifi::config_dir}/logback.xml":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/logback.xml'),
  }

  file { "${nifi::config_dir}/nifi.properties":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/nifi.properties'),
  }

  file { "${nifi::config_dir}/zookeeper.properties":
    ensure  => file,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    content => file('nifi/config/zookeeper.properties'),
  }

}
