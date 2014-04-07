module Coub
  module Response
    def self.create( response_hash )
      data = response_hash.data.dup rescue response_hash.dup
      data.extend( self )
      data.instance_exec do
        @pagination = Hashie::Mash.new(
          page: response_hash.page.to_i,
          total_pages: response_hash.total_pages.to_i,
          per_page: response_hash.per_page.to_i
        )
        @meta = response_hash.meta
      end
      data
    end

    attr_reader :pagination
    attr_reader :meta
  end
end
