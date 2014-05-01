require "test_helper"

module Chimpanzee
  module Api2
    describe ApiCaller do
      describe ".initialize" do
        it "should raise error if api_key is not set" do
          old = Chimpanzee.configuration.api_key
          Chimpanzee.configuration.api_key = nil
          Proc.new do
            ApiCaller.new
          end.must_raise Chimpanzee::InvalidConfigException
          Chimpanzee.configuration.api_key = old
        end
        it "should raise error if access_token is not set" do
          old = Chimpanzee.configuration.access_token
          Chimpanzee.configuration.access_token = nil
          Proc.new do
            ApiCaller.new
          end.must_raise Chimpanzee::InvalidConfigException
          Chimpanzee.configuration.access_token = old
        end
      end
      describe "with valid api key" do
        before do
          configure_chimpanzee
        end

        it "build url with given parameters" do
          a = ApiCaller.new
          url = a.build_url 'surveys_get_survey_list'
          url.must_equal "/v2/surveys/get_survey_list"
        end

        it "calls get_survey_list and gets the result" do
          FakeWeb.register_uri(:post, "https://api.surveymonkey.net/v2/surveys/get_survey_list?api_key=#{Chimpanzee.configuration.api_key}", body: '{"status":0,"data":{"surveys":[{"survey_id":"123456"}],"page":1,"page_size":1000}}')
          a = ApiCaller.new
          resp = a.surveys_get_survey_list
          resp.is_a?(Hash).must_equal true
        end

      end
    end
  end
end
