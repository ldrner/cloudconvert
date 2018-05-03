require 'cloudconvert/errors'
require 'cloudconvert/api/response'

module Cloudconvert
  class ResponseParser

    def self.parse(response)
      response_hash = Cloudconvert::Utilities.deep_symbolize_keys(JSON.parse(response.body.to_s))

      raise Cloudconvert::APIError.new(response_hash[:error], response_hash[:code]) if response.code != 200

      Cloudconvert::Api::Response.new(response_hash)
    end
  end
end
