module Coub

  class Error < StandardError; end

  class BadRequest < Error; end

  class Unauthorized < Error; end

  class NotFound < Error; end

  class InternalServerError < Error; end

  class BadGateway < Error; end

  class ServiceUnavailable < Error; end

  class GatewayTimeout < Error; end

end
