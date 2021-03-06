define rabbitmq::plugin($ensure='present', $plugin_dir='', $version) {
	$plugin_url = "http://www.rabbitmq.com/releases/plugins/v${version}/${name}-${version}.ez"

	if $plugin_dir == '' {
		$_plugin_dir = "/usr/lib/rabbitmq/lib/rabbitmq_server-${version}/plugins"
	} else {
		$_plugin_dir = $plugin_dir
	}

	$plugin_path = "${_plugin_dir}/${name}-${version}.ez"

	if $ensure == "present" {
		exec { "Downloading RabbitMQ plugin ${name}":
			command => "/usr/bin/wget ${plugin_url} -O ${plugin_path}",
			creates => $plugin_path,
		}
	} else {
		file { $plugin_path:
			ensure => absent,
		}
	}
}
