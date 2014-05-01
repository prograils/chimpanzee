module Chimpanzee
  module Api2
    autoload :ApiCaller, 'chimpanzee/api2/api_caller'
    autoload :Collectors, 'chimpanzee/api2/collectors'
    autoload :MissingMethod, 'chimpanzee/api2/missing_method'
    autoload :Surveys, 'chimpanzee/api2/surveys'
    autoload :User, 'chimpanzee/api2/user'
    class << self
      attr_writer :api_caller
    end


    def self.surveys
      @surveys ||= Api2::Surveys.new
    end
    def self.user
      @user ||= Api2::User.new
    end
    def self.collectors
      @collectors ||= Api2::Collectors.new
    end

    def self.api_caller
      return @api_caller if @api_caller
      self.api_caller = ApiCaller.new
    end

    def self.get_api_caller(*args)
      self.api_caller.get_api_caller(*args)
    end
  end
end
