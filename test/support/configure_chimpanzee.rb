module ConfigureChimpanzee
  def configure_chimpanzee
    Chimpanzee.configure do |c|
      c.api_key = ENV['CHIMPANZEE_API_KEY'] || ENV['API_KEY'] || "test"
      c.access_token = ENV['CHIMPANZEE_ACCESS_TOKEN'] || ENV['ACCESS_TOKEN'] || "test"
    end
    @api = Chimpanzee.api
  end
end
