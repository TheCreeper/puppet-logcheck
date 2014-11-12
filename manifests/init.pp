# init.pp

class logcheck (

	$package_ensure = latest,
	$package_name = 'logcheck',

	$configdir = '/etc/logcheck',

	$logcheck_date = undef,
	$logcheck_intro = undef,
	$logcheck_report_lvl = 'server',
	$logcheck_mailto = 'root',
	$logcheck_fqdn = $fqdn,
	$logcheck_sortuniq = undef,
	$logcheck_support_cracking_ignore = undef,
	$logcheck_ruledir = undef,
	$logcheck_syslogsummary = undef,

	$logcheck_attacksubj = undef,
	$logcheck_securitysubj = undef,
	$logcheck_eventsubj = undef,

	$logcheck_addtag = undef,
) {

	validate_string($package_ensure)
	validate_string($package_name)

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
