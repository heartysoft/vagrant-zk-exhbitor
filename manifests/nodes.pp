
$exVersion = '1.0'
$zoo1 = '192.168.60.2'
$zoo2 = '192.168.60.3'
$zoo3 = '192.168.60.4'

$properties = {
			'com.netflix.exhibitor-rolling.zookeeper-data-directory' => '/var/lib/zookeeper/data',
            'com.netflix.exhibitor.zookeeper-data-directory' => '/var/lib/zookeeper/data',
            'com.netflix.exhibitor.zookeeper-install-directory' => '/usr/local/zookeeper',
            'com.netflix.exhibitor-rolling.zookeeper-install-directory' => '/usr/local/zookeeper',
            'com.netflix.exhibitor-rolling.zookeeper-log-directory' => '/var/log/zookeeper',
            'com.netflix.exhibitor-rolling.servers-spec' => "S:1:$zoo1,S:2:$zoo2,S:3:$zoo3",
            'com.netflix.exhibitor.servers-spec' => "S:1:$zoo1,S:2:$zoo2,S:3:$zoo3",
}

node 'zoo1' {
	class {'jdk': }
	->
	class { 'zookeeper':
		downloadDir => '/vagrant/zookeeper',
	}
	->
	class { 'exhibitor':
		version => $exVersion,
		install_source => 'puppet:///modules/exhibitor',
		install_method => 'cp',
		opts => {
			fsconfigdir => '/vagrant',
			hostname => $::ipaddress_eth1,
		},
		properties => $properties
	} -> 
	class { 'zkui':
		version => '2.0-SNAPSHOT',
		properties => {
			'serverPort' => '9050',
			'zkServer' => "$zoo1:2181,$zoo2:2181,$zoo2:2181",
		}
	}
}





node 'zoo2', 'zoo3' {
	class {'jdk': }
	->
	class { 'zookeeper':
		downloadDir => '/vagrant/zookeeper',
	}
	->
	class { 'exhibitor':
		version => $exVersion,
		install_source => 'puppet:///modules/exhibitor',
		install_method => 'cp',
		opts => {
			fsconfigdir => '/vagrant',
			hostname => $::ipaddress_eth1,
		},
		properties => $properties
	}
}
