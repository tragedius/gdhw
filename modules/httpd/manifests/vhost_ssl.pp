define httpd::vhost_ssl ($port, $server_name, $doc_root, $vhost_name) {

	require httpd

	file { "/etc/httpd/conf.d/$server_name.conf":
		content	=> template('/etc/puppet/modules/httpd/files/etc/httpd/conf.d/vhost_ssl.conf.erb'),
		owner	=> 'root',
		group 	=> 'root',
		mode	=> '0644',
	}

	file { "/etc/httpd/ssl/$server_name.crt":
		ensure  => present,
		source	=> "/etc/puppet/modules/httpd/files/etc/httpd/ssl/$server_name.crt",
		owner	=> 'apache',
		group 	=> 'apache',
		mode	=> '0500',
	}

	file { "/etc/httpd/ssl/$server_name.key":
		ensure  => present,
		source	=> "/etc/puppet/modules/httpd/files/etc/httpd/ssl/$server_name.key",
		owner	=> 'apache',
		group 	=> 'apache',
		mode	=> '0500',
	}
}
