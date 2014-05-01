require "test_helper"

module Chimpanzee
  module Api2
    describe Collectors do
      before do
        configure_chimpanzee
      end

      it "should transfer method call to Api2 class" do
        mock_obj = Minitest::Mock.new
        @api.api_caller = mock_obj
        mock_obj.expect('user_get_user_details', [])
        @api.user.get_user_details
        mock_obj.verify
      end
    end
  end
end


