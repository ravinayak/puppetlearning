include ssh
class sshservicesetup {
  $ssh_packages = lookup('ssh_packages', Array)
  $permit_root_login = lookup('permit_root_login', Boolean)
  $ssh_users = lookup('ssh_primary_users', Array)

  package { $ssh_packages:
    ensure => present,
    before => File['/etc/ssh/sshd_config'],
  }

  file {'/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('ssh/sshd_config.epp')
  }
  servicee { 'ssh':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
