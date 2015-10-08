class vnext::libuv {
	
	exec { 'apt-get-update':  
    	command     => 'sudo apt-get update',
		path => '/usr/bin',
	}
	
	package { "make":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	
	package { "automake":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	package { "libtool":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	package { "curl":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	
	file { '/tmp/download_build_libuv.sh':
		 source => 'puppet:///modules/vnext/download_build_libuv.sh',
		 mode => '0755',
	}
	
	exec { 'download_build_libuv':
		command => '/tmp/download_build_libuv.sh',
		require => [File['/tmp/download_build_libuv.sh'], Package['make'], Package['automake'], Package['libtool'], Package['curl']], 
	}
}