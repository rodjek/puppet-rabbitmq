define rabbitmq::server($version, $ensure='present', $bind_address="0.0.0.0", $bind_port="6163") {
	package { "rabbitmq-server":
		ensure => $ensure ? {
			"present" => $version,
			default   => absent,
		},
		notify => Service["rabbitmq-server"],
	}

	service { "rabbitmq-server":
		ensure  => $ensure ? {
			"present" => running,
			default   => stopped,
		},
		enable  => $ensure ? {
			"present" => true,
			default   => false,
		}
		require => File["/etc/rabbitmq/rabbitmq.conf"],
	}

	file { "/etc/rabbitmq/rabbitmq.conf":
		content => template("rabbitmq/etc/rabbitmq/rabbitmq.conf"),
		owner   => "root",
		group   => "root",
		mode    => "0444",
		notify  => Service["rabbitmq-server"],
		require => Package["rabbitmq-server"],
	}
}
