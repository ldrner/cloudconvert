require "cloudconvert/api/client"
require "cloudconvert/version"
require "cloudconvert/connection"
require "cloudconvert/response_parser"
require 'cloudconvert/utilities'

module Cloudconvert
  class << self

    def client(configuration)
      connection = build_connection(configuration)
      Cloudconvert::Api::Client.new(connection, response_parser)
    end

    private

    def build_connection(configuration)
      Cloudconvert::Connection.new(configuration)
    end

    def response_parser
      Cloudconvert::ResponseParser
    end

  end
end
