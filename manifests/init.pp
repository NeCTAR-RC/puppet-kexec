class kexec {

  package { 'kexec-tools':
    ensure => installed,
  }
 
  #Bug Fix: https://bugs.launchpad.net/ubuntu/+source/kexec-tools/+bug/1383096

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
    require => package['kexec-tools'],
  }

}
