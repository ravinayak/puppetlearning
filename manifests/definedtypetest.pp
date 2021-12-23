define puppetlearning::definedtypetest(){
  file{'/codetestfiles/definedtypetest1.txt':
    ensure => file,
  }
  user{'strangedoc':
    ensure => present,
  }
}
Puppetlearning::Definedtypetest{ '/tmp/newfile': }
