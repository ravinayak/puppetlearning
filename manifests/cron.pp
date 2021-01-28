cron{ 'cron example':
	command => '/bin/date +%F',
	user => 'neo',
	environment => ['MAILTO=ravinayak19@gmail.com', 'PATH=/bin'],
	hour => '*',
	minute => '*/15',
	weekday => ['Thursday'], 
}
cron { 'run daily backup':
	command => '/usr/local/bin/backup',
	minute => '0',
	hour => fqdn_rand(24, 'run daily backup'),
}