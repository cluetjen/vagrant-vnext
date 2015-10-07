class vnext::dnvm {
	
	package { "unzip":
		ensure => "installed",
	}
	package { "curl":
		ensure => "installed",
	}
	
	exec { "download_dnvm":
		command => "bash -c 'curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | HOME=/home/vagrant DNX_USER_HOME=/home/vagrant/.dnx DNX_BRANCH=dev sh && chmod -R 0777 /home/vagrant/.dnx && /home/vagrant/.dnx/dnvm/dnvm.sh'",
		path    => '/usr/bin:/bin',
		require => Package['curl'],
	}
}