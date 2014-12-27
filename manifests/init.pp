# init.pp

class logcheck (

	$package_ensure = present,
	$package_name = 'logcheck',

	$package_database_manage = true,
	$package_database_ensure = $package_ensure,
	$package_database_name = 'logcheck-database',

	$package_syslog_summary_manage = false,
	$package_syslog_summary_ensure = $package_ensure,
	$package_syslog_summary_name = 'syslog-summary',

	$configdir = '/etc/logcheck',

	$logcheck_date = undef,
	$logcheck_intro = undef,
	$logcheck_report_lvl = 'server',
	$logcheck_mailto = 'logcheck',
	$logcheck_mailasattach = 0,
	$logcheck_fqdn = 1,
	$logcheck_sortuniq = undef,
	$logcheck_support_cracking_ignore = undef,
	$logcheck_ruledir = undef,
	$logcheck_syslogsummary = undef,

	$logcheck_attacksubj = undef,
	$logcheck_securitysubj = undef,
	$logcheck_eventsubj = undef,

	$logcheck_addtag = undef,

	$logcheck_tmp = '/tmp',
) {

	validate_string($package_ensure)
	validate_string($package_name)

	validate_bool($package_database_manage)
	validate_string($package_database_ensure)
	validate_string($package_database_name)

	validate_string($configdir)

	validate_string($logcheck_date)
	validate_string($logcheck_intro)
	validate_string($logcheck_report_lvl)
	validate_string($logcheck_mailto)
	validate_string($logcheck_fqdn)
	validate_string($logcheck_sortuniq)
	validate_string($logcheck_support_cracking_ignore)
	validate_string($logcheck_ruledir)
	validate_string($logcheck_syslogsummary)

	validate_string($logcheck_attacksubj)
	validate_string($logcheck_securitysubj)
	validate_string($logcheck_eventsubj)

	validate_string($logcheck_addtag)

	class{ 'logcheck::install': }->
	class{ 'logcheck::config': }
}
