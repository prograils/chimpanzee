require "test_helper"

module Chimpanzee
  describe Configuration do
    it "should has surveymonkes host already set" do
      configuration = Configuration.new
      configuration.surveymonkey_host.must_equal 'https://api.surveymonkey.net'
    end

    it "should allow changing config values" do
      configuration = Configuration.new
      configuration.surveymonkey_host = 'http://google.com'
      configuration.api_key = 'foobar'
      configuration.surveymonkey_host.must_equal 'http://google.com'
      configuration.api_key.must_equal 'foobar'
    end
  end
end
