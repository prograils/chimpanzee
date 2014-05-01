require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'

require 'chimpanzee'
require 'fakeweb'

## support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class MiniTest::Spec
  include ConfigureChimpanzee
  before do
    FakeWeb.clean_registry
  end
  after do
    FakeWeb.clean_registry
  end
end
