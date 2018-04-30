require 'ostruct'
require 'cloudconvert/errors'

module Cloudconvert
  class ResponseParser
    def self.parse(response)
      struct = OpenStruct.new(JSON.parse(response))

      raise Cloudconvert::APIError.new(struct.error, struct.code) if response.code != 200

      struct
    end
  end
end
