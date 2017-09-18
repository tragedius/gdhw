node default {
	# include httpd
	httpd::vhost { 'a.traged.net':
		port 		=> 80,
		server_name 	=> 'a.traged.net',
		vhost_name 	=> '*',
		doc_root 	=> 'a.traged.net',
	}
}
