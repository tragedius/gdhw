define httpd::vhost ($port, $server_name, $vhost_name, $doc_root) {
	require httpd
	file { "/etc/httpd/conf.d/$server_name.conf":
		content	=> template('/etc/puppet/modules/httpd/files/etc/httpd/conf.d/vhost.conf.erb'),
		owner	=> 'root',
		group 	=> 'root',
		mode	=> '0644',
	}
	file { "/etc/httpd/conf.d/welcome.conf":
		ensure	=> absent,
	}
	
}
