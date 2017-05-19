class nifi::install {

  file { $nifi::download_dir:
    ensure => directory,
    owner  => $nifi::nifi_user,
    group  => $nifi::nifi_group,
  }

  file { $nifi::extract_dir:
    ensure => directory,
    owner  => $nifi::nifi_user,
    group  => $nifi::nifi_group,
  }

  file { $nifi::log_dir:
    ensure => directory,
    owner  => $nifi::nifi_user,
    group  => $nifi::nifi_group,
  }

  file { $nifi::pid_dir:
    ensure => directory,
    owner  => $nifi::nifi_user,
    group  => $nifi::nifi_group,
  }

  if $nifi::package_name == undef {
    #    include '::archive'

    archive { "${nifi::download_dir}/${nifi::basefilename}":
      ensure          => present,
      extract         => true,
      extract_command => 'tar xfv %s --strip-components=1',
      extract_path    => $nifi::extract_dir,
      source          => $nifi::package_url,
      creates         => "${nifi::extract_dir}/bin",
      cleanup         => true,
      user            => $nifi::nifi_user,
      group           => $nifi::nifi_group,
      require         => [
        File[ $nifi::download_dir ],
        File[ $nifi::extract_dir ],
        Group[ $nifi::nifi_group ],
        User[ $nifi::nifi_user ],
      ],
      before          => File[ $nifi::install_dir ],
    }
  } else {

    package { $nifi::package_name:
      ensure => $nifi::package_ensure,
      before => File[ $nifi::install_dir ],
    }
  }

  file { $nifi::install_dir:
    ensure  => link,
    target  => $nifi::extract_dir,
    require => File[ $nifi::extract_dir],
  }

  file { $nifi::config_dir:
    ensure  => directory,
    owner   => $nifi::nifi_user,
    group   => $nifi::nifi_group,
    require => [
      Group[ $nifi::nifi_group ],
      User[ $nifi::nifi_user ],
      Archive[ "${nifi::download_dir}/${nifi::basefilename}" ],
    ],
  }
}



