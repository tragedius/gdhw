node default {
	httpd::vhost { 'a':
		port 		=> 80,
		server_name 	=> 'a.traged.net',
		vhost_name	=> "*",	
		doc_root 	=> 'a.traged.net',
		allowes		=> 'Redirect'
	}
	
	httpd::vhost { 'b':
		port 		=> 80,
		server_name 	=> 'b.traged.net',
		vhost_name	=> "*",	
		rdr_dummy	=> true,
		rdr_from	=> '/',
		rdr_to		=> 'https://b.traged.net',
	}

	httpd::vhost { 'b_ssl':
		port		=> 443,
		server_name     => 'b.traged.net',
                vhost_name      => "*",
		ssl		=> true,
		doc_root 	=> 'b.traged.net',
		doc_alias        => '"/" "/foo"',
	}

	httpd::vhost { 'c':
		port 		=> 80,
		server_name 	=> 'c.traged.net',
		vhost_name	=> "*",	
		rdr_dummy	=> true,
		rdr_from	=> '/',
		rdr_to		=> 'https://c.traged.net',
	}

	httpd::vhost { 'c_ssl':
		port		=> 443,
		server_name     => 'c.traged.net',
                vhost_name      => "*",
		ssl		=> true,
		doc_root 	=> 'c.traged.net',
	}

	httpd::vhost { 'd':
		port 		=> 443,
		server_name 	=> 'd.traged.net',
		vhost_name	=> "*",	
		server_aliases	=> 'e.traged.net f.traged.net',
		ssl		=> true,
		rdr_dummy	=> true,
		rdr_from        => '/',
		rdr_to          => 'https://c.traged.net',
	}


        file { "/etc/httpd/conf.d/welcome.conf":
                ensure  => absent,
	}

}
