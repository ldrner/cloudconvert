require 'dry-initializer'
require 'http'

module Cloudconvert
  class Connection
    extend Dry::Initializer

    BASE_PATH = 'https://api.cloudconvert.com/'.freeze

    option :apikey

    def post(path, params = {})
      HTTP.basic_auth(:user => apikey).post(url(path), params)
    end

    def get(path, params = {})
      HTTP.basic_auth(:user => apikey).get(url(path), params)
    end

    private

    def url(path)
      URI.join(BASE_PATH, path)
    end
  end
end