define httpd::vhost ($port, $server_name, $vhost_name, $server_aliases=false, $doc_alias=false, $ssl = false , $doc_root=false, $rdr_dummy = false, $rdr_from=false, $rdr_to=false, $allowes=false) {
	contain httpd
	file { "/etc/httpd/conf.d/$server_name-$port.conf":
		content	=> template('/etc/puppet/modules/httpd/files/etc/httpd/conf.d/vhost.conf.erb'),
		owner	=> 'root',
		group 	=> 'root',
		mode	=> '0644',
		notify	=> Service['httpd']
	}
		
	if $ssl == true {
	
		file { "/etc/httpd/ssl/$server_name.crt":
			ensure  => present,
			source	=> "/etc/puppet/modules/httpd/files/etc/httpd/ssl/$server_name.crt",
			owner	=> 'apache',
			group 	=> 'apache',
			mode	=> '0500',
			notify	=> Service['httpd']
		}

		file { "/etc/httpd/ssl/$server_name.key":
			ensure  => present,
			source	=> "/etc/puppet/modules/httpd/files/etc/httpd/ssl/$server_name.key",
			owner	=> 'apache',
			group 	=> 'apache',
			mode	=> '0500',
			notify	=> Service['httpd']
		}
	}
}
