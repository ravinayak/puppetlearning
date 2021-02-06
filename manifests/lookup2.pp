notice("Apache is set to use ${lookup('apache_worker_factor', Integer)} workers")
unless lookup('apparmor_enabled', Boolean) {
	notice('I am in apparmor function')
	exec('apt-get -y remove-apparmor')
}
notice('dns_allow_query_enabled: ', lookup('dns_allow_query', Boolean))
if lookup('is_production', Boolean) {
	notice("Production environment")
	notice("Here are the values of monitor_ips :: ${lookup('monitor_ips', Array[String])}")
}