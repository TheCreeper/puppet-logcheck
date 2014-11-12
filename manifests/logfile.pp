define logcheck::logfile (

	$ensure = present,
	$file,
) {

	concat::fragment { $name:

		ensure => $ensure,
		target => "${logcheck::configdir}/logcheck.logfiles",
		content => "${file}\n",
	}
}
