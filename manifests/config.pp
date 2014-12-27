# config.pp

class logcheck::config {

	$config_ensure = $logcheck::package_ensure ? {

		'absent' => 'absent',
		'purged' => 'absent',
		default => present,
	}

	$config_directory_ensure = $config_ensure ? {

		'absent' => 'absent',
		default => directory,
	}

	file { "${logcheck::configdir}":

		ensure => $config_directory_ensure,
		force => true,
		mode => '0755',
		owner => 'root',
		group => 'logcheck',
	}->
	file { "${logcheck::configdir}/logcheck.conf":

		ensure => $config_ensure,
		mode => '0640',
		owner => 'root',
		group => 'logcheck',
		content => template('logcheck/etc/logcheck.conf.erb'),
	}
}