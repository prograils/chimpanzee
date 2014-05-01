require "chimpanzee/api2"
require "chimpanzee/configuration"
require "chimpanzee/exceptions"
require "chimpanzee/version"

module Chimpanzee
  class << self
    attr_writer :configuration
    attr_writer :api
  end

  def self.configuration
    return @configuration if @configuration
    self.configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.api
    return @api if @api
    self.api = Chimpanzee::Api2
  end

end
