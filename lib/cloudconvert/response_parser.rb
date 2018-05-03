require 'cloudconvert/errors'
require 'cloudconvert/api/response'

module Cloudconvert
  class ResponseParser
    def self.parse(response)
      response_hash = JSON.parse(response.body.to_s).deep_symbolize

      raise Cloudconvert::APIError.new(response_hash[:error], response_hash[:code]) if response.code != 200

      Cloudconvert::Api::Response.new(response_hash)
    end
  end
end
