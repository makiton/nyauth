require 'nyauth/engine'
require 'nyauth/encryptor'
require 'nyauth/configuration'

module Nyauth
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
Nyauth.configure {}
