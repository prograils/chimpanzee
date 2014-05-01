require "test_helper"

describe Chimpanzee do
  describe "#configuration" do
    it 'should return configuration' do
      c = Chimpanzee.configuration
      c.class.must_equal Chimpanzee::Configuration
    end
  end

  describe "#configure" do
    before do
      Chimpanzee.configure do |c|
        c.api_key = 'test'
      end
    end

    it 'should properly set values in block' do
      config = Chimpanzee.configuration
      config.api_key.must_equal 'test'
    end
  end

  describe "#api" do
    it 'should return api object' do
      c = Chimpanzee.api
      c.must_equal Chimpanzee::Api2
    end
  end
end
