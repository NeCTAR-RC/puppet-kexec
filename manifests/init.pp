class kexec {

  package { 'kexec-tools':
    ensure => installed,
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
