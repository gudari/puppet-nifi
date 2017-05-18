class nifi::service {

  if $nifi::service_install {
    if $::service_provider == 'systemd' {

      exec { "systemctl-daemon-reload-${nifi::service_nifi}":
        command     => 'systemctl daemon-reload',
        refreshonly => true,
        path        => '/usr/bin',
      }

      file { "${nifi::service_nifi}.service":
        ensure  => file,
        path    => "/etc/systemd/system/${nifi::service_nifi}.service",
        mode    => '0644',
        content => template('nifi/service/unit-nifi.erb'),
      }

      file { "/etc/init.d/${nifi::service_nifi}":
        ensure => absent,
      }

      File["${nifi::service_nifi}.service"] ~>
      Exec["systemctl-daemon-reload-${nifi::service_nifi}"] ->
      Service[$nifi::service_nifi]

    } else {

      file { "${nifi::service_nifi}.service":
        ensure  => file,
        patgh   => "/etc/init.d/${nifi::server_nifi}",
        mode    => '0755',
        content => template('nifi/service/init-nifi.erb'),
      }
    }

    service { $nifi::service_nifi:
      ensure     => $nifi::service_ensure,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }

  } else {
    debug('Skipping service install')
  }
}

