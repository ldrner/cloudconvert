require 'dry-initializer'
require 'http'

module Cloudconvert
  class Connection
    # extend Dry::Initializer
    # attr_reader :apikey
    # private :apikey
    # option :apikey

    BASE_PATH = 'https://api.cloudconvert.com/'.freeze

    def initialize(opts)
      @apikey = opts[:apikey]
    end

    def post(path, params = {})
      HTTP.follow(max_hops: 1)
          .post(url(path), form: params.merge(apikey: apikey))
    end

    def get(path, params = {})
      HTTP.get(path, params)
    end

    private

    def apikey
      @apikey
    end

    def url(path)
      URI.join(BASE_PATH, path)
    end
  end
end