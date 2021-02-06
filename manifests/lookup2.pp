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
$cobbler_config=lookup('cobbler_config', Hash)
if(lookup('cobbler_config.manage_dhcp', Boolean)) {
	notice("$cobbler_config.manage_dhcp is enabled :: ${cobbler_config['manage_dhcp']}")
}
if(lookup('cobbler_config.pxe_just_once', Boolean)) {
	notice("cobbler_config.pxe_just_once is enabled :: ${cobbler_config['pxe_just_once']}")
}
notice("backup_path: ${lookup('backup_path', String)}")
notice("new_vpn_allow_list: ${lookup('new_vpn_allow_list')}")