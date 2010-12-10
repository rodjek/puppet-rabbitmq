module Puppet::Parser::Functions
  newfunction(:rabbitmq_version, :type => :rvalue, :doc => "Given a package version (e.g. 2.2.0-1), return the RabbitMQ version (e.g. 2.2.0)") do |args|
    args[0].is_a? String or raise Puppet::Error.new("I pity the fool who didn't pass rabbitmq_version a String!")
    args[0].split('-').first
  end
end
