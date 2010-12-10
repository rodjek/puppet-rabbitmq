puppet-rabbitmq
===============

A Puppet module to install & configure RabbitMQ and it's associated plugins.
This module assumes that you have the rabbitmq-server package available in
your repository.

Usage
-----

    rabbitmq::server { $fqdn:
        version => "2.2.0",
        ensure  => present,
    }
