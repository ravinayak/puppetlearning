file{'/tmp/track_update.txt':
	ensure => present,
	content => 'This is a sample txt file',
	notify => Exec['apt-get-update'],
}
exec{ 'apt-get-update': 
	command => '/usr/bin/apt-get update -y',
	refreshonly => true,
}
$php_package='php7.0-cli'
#package { $php_package:
#	ensure => installed,
#}
$my_name="Ravi"
notice("Hello, my name is $my_name")
$heights=[10,15,21,34]
$heights.each |$height| {
	notice("Height is $height")
}
$dependencies=[
	'php7.0-cgi',
	'php7.0-common',
	'php7.0-gd',
	'php7.0-json',
	'php7.0-mcrypt',
	'php7.0-mysql',
	'php7.0-soap',
]
# package { $dependencies:
#	ensure => installed,
# }
$heights_hash = {
	'john' => 193,
	'saun' => 335,
}
notice("John's height is ${heights_hash['saun']}")
$attributes={
	'owner' => 'ubuntu',
	mode => '0755',
	group => 'ubuntu',
}
file { '/tmp/text':
	ensure => present,
	* => $attributes,
}
$value =(25*82)+(12/4)-(3)
notice("Answer for expression posted above is :: $value")
notice(9<10)
notice(11>10)
notice(10>=10)
notice(9<=10)
notice('foo' == 'foo')
notice('to'!='fo')
notice(11!=10)
notice('foo' in 'foo')
notice('foo' in 'foobar')
notice('foo' in ['foo', 'bar'])
notice('foo' in {'foo' => 'bar'})
notice('foo' =~ /f*/)
notice('foo' =~ /String/)

$candidate='foo'
notice($candidate =~/fo*/)
notice($candidate =~ /f.o/)
notice($candidate =~ /fo+/)
notice($candidate =~ /[fgh][ogi][oik]/)

$install_perl=true
if $install_perl {
	package { 'perl':
		ensure => installed,
	} 
}else {
		package { 'perl':
			ensure => absent,
		}
}

$webserver='nginx'
case $webserver {
	'nginx': {
		notice('nginx selected for installation')
	}
	'apache': {
		notice('apache not selected')
	}
	'httpd': {
		notice('httpd not selected')
	}
}

notice($facts['kernel'])
notice($facts['os']['architecture'])
notice($facts['os']['distro']['codename'])
if $facts['os']['selinux']['enabled'] {
	notice('SE Linux OS has been selected')
}
$buffer_pool= $facts['memory']['system']['total_bytes'] * (3/4)
notice("Buffer pool is $buffer_pool")

notice("My hostname is ${facts['hostname']}")
notice("My FQDN is ${facts['fqdn']}")
notice("My IP is ${facts['networking']['ip']}")

$tasks=['task1', 'task2', 'task3']
$tasks.each |$task| {
	file{ "/tmp/$task":
		content => "I am $task \n",
		mode => '0755',
	}
}


