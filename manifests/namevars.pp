package { 'apache':
	ensure => installed,
	name => 'httpd',
}

package { 'apache2':
	ensure => installed,
	provider => 'httpd-one'
}