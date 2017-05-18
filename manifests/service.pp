class nifi::service {

  if $nifi::service_install {
    if $::service_provider == 'systemd' {

      exec { "systemctl-daemon-reload-${nifi::service_name}":
        command     => 'systemctl daemon-reload',
        refreshonly => true,
        path        => '/usr/bin',
      }

      file { "${nifi::service_name}.service":
        ensure  => file,
        path    => "/etc/systemd/system/${nifi::service_name}.service",
        mode    => '0644',
        content => template('nifi/service/unit-nifi.erb'),
      }

      file { "/etc/init.d/${nifi::service_name}":
        ensure => absent,
      }

      File["${nifi::service_name}.service"] ~>
      Exec["systemctl-daemon-reload-${nifi::service_name}"] ->
      Service[$nifi::service_name]

    } else {

      file { "${nifi::service_name}.service":
        ensure  => file,
        patgh   => "/etc/init.d/${nifi::service_name}",
        mode    => '0755',
        content => template('nifi/service/init-nifi.erb'),
      }
    }

    service { $nifi::service_name:
      ensure     => $nifi::service_ensure,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }

  } else {
    debug('Skipping service install')
  }
}

