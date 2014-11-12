# install.pp

class logcheck::install {

	package { $logcheck::package_name:

		ensure => $logcheck::package_ensure,
	}
}