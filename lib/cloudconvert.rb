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
<<<<<<< HEAD
=======
      # Cloudconvert::Connection.new(apikey: 'LzmNBhVWT3S7xtDNyMwqbn7kuPmdwK2nCdK9PuQdPpIugEOLw4VY1lUBuFOmjamK')
>>>>>>> 84c23fbe7696587d9e10956e4090b44bf2d518bc
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
