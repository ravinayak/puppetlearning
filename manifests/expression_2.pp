file{'/tmp/track_update_2.txt':
	ensure => present,
	content => 'This file will result in apt-get update',
	notify => Exec['apt-get-update'],
}
exec{'apt-get-update':
	command => '/bin/apt-get update -y',
	refreshonly => true,
	notice('Apt get update command is being run'),
}
$ruby='ruby'
package { $ruby:
	ensure => installed,
}
$heights=[10,11,12]
$heights.each |$height| {
	notice("The height is $height")
}
$webserver='nginx'
case $webserver {
	'nginx': {
		notice('Nginx has been selected')
	}
	'apache': {
		notice('Apache has been selected')
	}
	default: {
		notice(Nothing has been selected)
	}
}
$perl='perl'
if $perl {
	notice('Perl has been selected')
}else {
	notice('Ruby has been selected')
}

$attributes={
	owner => 'ubuntu',
	mode => '0755',
	content => 'Hi there',
}

file{'/tmp/attribues_operator':
	ensure => present,
	* => $attributes
}

notice("${facts['os']['distro']} ")
notice("Networking :: ${facts['networking']['hostname']}")
