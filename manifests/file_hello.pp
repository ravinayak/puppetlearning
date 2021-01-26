file{ '/tmp/hello.txt':
	ensure => file,
	content => "# This file is managed by Puppet, any manual edits will be lost \nhello world \n",
}