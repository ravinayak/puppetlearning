user { 'neo':
	ensure => present,
	home => '/home/neo',
}
file {'/home/neo':
	ensure => directory,
}
file { '/home/neo/.ssh': 
	ensure => directory,
}
ssh_authorized_key {'neo@vagrant-focal': 
	user => 'neo',
	type => 'ssh-rsa',
	key => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDQYsfS0+HZRGWWyXsF9UqSJPE8X98kES9yTYOvTvCVmos+M/+s7pB79VhfZXcLBfVu4CjVRSsjY0YRMI1xntbHkOaqIWTIM3L2ldbNyAGriP53AHS2Elbp9DPJnKD8pJGNxQPECRGM5jIMXBtRWzyZ39hMMYbuYTsMb5pOGn3FIB3Zj4ZVCentMuMlK+4HjPFzu3XXGqL3WsgSpcZUAwMQTr3xNhkR6/2UFKAEyWOoYDDXdW4vGhJyrmzoTrm7aNeydmmqqF372Ih6pgoHIfXVIxReSag0Y/+ekB4OlniK6GgTsKgjQl46Ay8QNDFB6U6i7hNlhsMFDnZAnSxv8C2scDqT+pRLZkJa3bj5eLQC4Wk8bztpBSClL8R7lCsz13GIujRu/8Lp385r5bWWrWarP5pos9XQ/Dl0b6lLEbJ6E2WQAx8Bv/Fx3Y5YByJDZUtUuOn6l9FvUi6jPFVazJiowKk4DI9dlNwvYlRi6MXEZkONIsi1y5YSlwSnxS5q1p8='
}
