require File.expand_path('../coub/configuration', __FILE__)
require File.expand_path('../coub/api', __FILE__)
require File.expand_path('../coub/client', __FILE__)
require File.expand_path('../coub/error', __FILE__)

module Coub
  extend Configuration

  def self.client(options={})
    Client.new(options)
  end

  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
