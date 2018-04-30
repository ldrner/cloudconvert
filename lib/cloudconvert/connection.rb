require 'http'
require 'cloudconvert/errors'
require 'ostruct'

module Cloudconvert
  class Connection
    BASE_PATH = 'https://api.cloudconvert.com/'.freeze

    attr_reader :apikey

    def initialize(options = {})
      @apikey = OpenStruct.new(options)[:apikey]
      raise AuthenticationError, "No API key provided." unless apikey
    end

    def post(path, params = {})
      HTTP.follow(max_hops: 1)
          .post(url(path), form: params.merge(apikey: apikey))
    end

    def get(path, params = {})
      HTTP.get(path, params)
    end

    private

    def url(path)
      URI.join(BASE_PATH, path)
    end
  end
end