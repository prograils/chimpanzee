require 'httparty'
module Chimpanzee
  module Api2
    class ApiCaller
      include HTTParty
      base_uri Chimpanzee.configuration.surveymonkey_host

      def initialize
        config = Chimpanzee.configuration
        if not config.api_key
          raise Chimpanzee::InvalidConfigException
        end
      end

      def method_missing(method, *args, &block)
        response = nil
        response = build_query(method, *args)
        begin
          JSON.parse(response.body)
        rescue
          nil
        end
      end

      def get_access_token(client_id, client_secret, redirect_uri, code)
        opts = {
                body: {
                    client_secret: client_secret,
                    code: code,
                    client_id: client_id,
                    grant_type: 'authorization_code',
                    redirect_uri: redirect_uri
                  },
                query: {
                    api_key: Chimpanzee.configuration.api_key
                  }
                }
        response = self.class.post '/oauth/token', opts
        Rails.logger.info response
        Rails.logger.info response.body
        begin
          JSON.parse(response.body)
        rescue
          nil
        end
      end

      private
      def build_query(method, *args)
        url = build_url(method)
        options = build_options(args.is_a?(Array) && args.first.is_a?(Hash) ? args.first : {})
        self.class.post url, options
      end

      def build_options(args={})
        {
          headers: {
            'Content-Type'=> 'application/json',
            'Authorization'=> "bearer #{Chimpanzee.configuration.access_token}"
          },
          query: {
            api_key: Chimpanzee.configuration.api_key
          }.merge(args),
          body: {
          }.merge(args).to_json
        }
      end

      def build_url(method)
        url = ['/v2']
        url << method.to_s.split('_', 2)
        url.flatten.join('/')
      end
    end
  end
end
