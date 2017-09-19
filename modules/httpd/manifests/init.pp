class httpd {
	package { 'httpd':
		ensure => installed,
	}
	package { 'mod_ssl':
		ensure => installed,
	}
	file { '/etc/httpd/conf/httpd.conf':
		source	=> '/etc/puppet/modules/httpd/files/etc/httpd/conf/httpd.conf',
		owner	=> 'root',
		group 	=> 'root',
		mode	=> '0644',
		notify	=> Service['httpd'], # restart httpd vzdy po zmene httpd.conf
		require => Package['httpd'],
	}
	file { '/etc/httpd/conf.d/ssl.conf':
		source	=> '/etc/puppet/modules/httpd/files/etc/httpd/conf.d/ssl.conf',
		owner	=> 'root',
		group 	=> 'root',
		mode	=> '0644',
		notify	=> Service['httpd'], # restart httpd vzdy po zmene httpd.conf
		require => Package['mod_ssl'],
	}
	file { "/etc/httpd/ssl":
		ensure => directory,
		owner	=> 'root',
		group 	=> 'root',
		mode	=> '0644',
	}
	
	service	{ 'httpd':
		ensure	=> running,
		enable	=> true,
	}

}
