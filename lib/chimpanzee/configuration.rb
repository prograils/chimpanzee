module Chimpanzee
  class Configuration
    attr_accessor :api_key
    attr_accessor :access_token
    attr_accessor :surveymonkey_host

    def initialize
      @surveymonkey_host = 'https://api.surveymonkey.net'
    end
  end
end
