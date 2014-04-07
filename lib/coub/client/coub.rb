module Coub
  class Client
    module Coub
      def oembed(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        id = args.first
        url = "http://coub.com/view/#{id}"
        options['url'] = url
        response = get("oembed", options)
        response
      end

      def search(*args)
        options = args.first.is_a?(Hash) ? args.pop : {}
        response = get('v1/search', options)
        response
      end
    end
  end
end
