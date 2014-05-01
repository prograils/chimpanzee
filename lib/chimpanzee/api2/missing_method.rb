module Chimpanzee
  module Api2
    module MissingMethod
      def method_missing(method, *args)
        method_name = self.class.to_s.split('::').last.downcase+'_'+method.to_s
        Chimpanzee.api.api_caller.send(method_name, *args)
      end
    end
  end
end
