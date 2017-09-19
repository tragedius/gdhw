node default {
	# include httpd
	httpd::vhost { 'a.traged.net':
		port 		=> 80,
		server_name 	=> 'a.traged.net',
		vhost_name	=> "*",	
		doc_root 	=> 'a.traged.net',
	}

	httpd::vhost_dummy { 'b.traged.net':
		port		=> 80,
		server_name     => 'b.traged.net',
                vhost_name      => "*",
	}

	httpd::vhost_ssl { 'b.traged.net':
		port 		=> 443,
		server_name 	=> 'b.traged.net',
		vhost_name	=> "*",	
		doc_root 	=> 'b.traged.net',
	}


        file { "/etc/httpd/conf.d/welcome.conf":
                ensure  => absent,
	}

}
