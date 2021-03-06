# install.pp

class logcheck::install {

	package { $logcheck::package_name:

		ensure => $logcheck::package_ensure,
	}

	if $logcheck::package_database_manage == true {

		package { $logcheck::package_database_name:

			ensure => $logcheck::package_database_ensure,
		}
	}

	if $logcheck::package_syslog_summary_manage == true {

		package { $logcheck::package_syslog_summary_name:

			ensure => $logcheck::package_syslog_summary_ensure,
		}
	}
}