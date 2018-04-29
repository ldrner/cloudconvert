require "cloudconvert/api/resource"
require "cloudconvert/version"
require "cloudconvert/connection"
require "cloudconvert/response_parser"
require 'ostruct'

module Cloudconvert

  class << self
    def configure
      yield configuration
    end

    def connection
      @@connection ||= Cloudconvert::Connection.new(configuration.to_h)
    end

    def response_parser
      Cloudconvert::ResponseParser
    end

    def convert(file_path)
      Cloudconvert::Api::Resource.new(connection, response_parser).convert(file_path)
    end

    def status(process_url)
      Cloudconvert::Api::Resource.new(connection, response_parser).status(process_url)
    end

    private

    def configuration
      @@configuration ||= ::OpenStruct.new
    end
  end
end
