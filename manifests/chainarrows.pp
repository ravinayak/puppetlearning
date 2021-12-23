class puppetlearning::chainarrows{
  user{'jimba':
    ensure => absent,
  }
  group{'group-11':
    ensure => absent,
  }
  group { 'group-12':
    ensure => 'absent'
  }
  group { 'group-13':
    ensure => 'absent'
  }
  User['jimba'] ~> [Group['group-11'], Group['group-12'], Group['group-13']]
}
include chainarrows
