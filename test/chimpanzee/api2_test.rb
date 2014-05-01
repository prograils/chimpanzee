require "test_helper"

module Chimpanzee
  describe Api2 do
    describe "with valid api key" do
      before do
        configure_chimpanzee
      end
      it "should return surveys object" do
        Chimpanzee::Api2.surveys.class.must_equal Api2::Surveys
      end
      it "should return user object" do
        Chimpanzee::Api2.user.class.must_equal Api2::User
      end
      it "should return collectors object" do
        Chimpanzee::Api2.collectors.class.must_equal Api2::Collectors
      end
      it "should return api_caller object" do
        Chimpanzee::Api2.api_caller.class.must_equal Api2::ApiCaller
      end
    end
  end
end
