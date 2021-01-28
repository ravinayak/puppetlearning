cron{ 'cron example':
	command => '/bin/date +%F',
	user => 'neo',
	environment => ['MAILTO=ravinayak19@gmail.com', 'PATH:/bin'],
	hour => '*',
	minute => '*/15',
	weekday => ['Thursday'], 
}