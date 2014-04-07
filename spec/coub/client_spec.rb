require 'helper'

module Coub
  describe Client do

    it "should connect using the endpoint configuration" do
      client = Client.new
      endpoint = URI.parse(client.endpoint)
      connection = client.send(:connection).build_url(nil).to_s
      (connection + '/').must_equal endpoint.to_s
    end
  end
end
