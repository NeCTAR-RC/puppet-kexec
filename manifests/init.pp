class kexec {

  package { 'kexec-tools':
    ensure => installed,
  }

  case $::lsbdistcodename {
    trusty: {
      file { '/etc/init.d/K18kexec-load':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => '0777',
        require => package['kexec-tools'],
        source  => 'puppet:///modules/kexec/etc-init.d-K18kexec-load',
      }
    }
  }

  file { '/etc/default/kexec':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('kexec/etc-default-kexec.erb'),
    require => Package['kexec-tools'],
  }

}
