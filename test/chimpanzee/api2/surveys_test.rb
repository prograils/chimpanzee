require "test_helper"

module Chimpanzee
  module Api2
    describe Surveys do
      before do
        configure_chimpanzee
        @api.api_caller = nil
      end

      after do
        @api.api_caller = nil
      end

      it "must transfer method call to Api2 class" do
        mock_obj = Minitest::Mock.new
        @api.api_caller = mock_obj
        mock_obj.expect('surveys_get_survey_list', [])
        @api.surveys.get_survey_list
        mock_obj.verify
      end

      it "must export survey to array" do
        s = Surveys.new
      end
    end
  end
end
