class vnext::dnxcore {
	include vnext::dnvm
	
	exec { 'apt-get-update':  
    	command     => '/usr/bin/apt-get update',
	}
	
	package { "libunwind8":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	package { "gettext":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	package { "libssl-dev":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	package { "libcurl3-dev":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	package { "zlib1g":
		ensure => "installed",
		require => Exec['apt-get-update'],
	}
	
	exec{ "upgrade-coreclr":
		environment => ['HOME=/home/vagrant', 'DNX_USER_HOME=/home/vagrant/.dnx'],
		command => "bash -c 'source /home/vagrant/.dnx/dnvm/dnvm.sh && dnvm upgrade -r coreclr'",
		path    => '/usr/bin:/bin',
		require => [Package['libunwind8'], Package['gettext'], Package['libssl-dev'], Package['libcurl3-dev'], Package['zlib1g']], 
	}
}