# require "bundler/setup"
require 'webmock/rspec'
require "cloudconvert"
require 'factory_bot'
require 'factory_bot/json_strategy'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.definition_file_paths = ['spec/factory_bot/factories']
    FactoryBot.find_definitions
    FactoryBot.register_strategy(:json, JsonStrategy)
  end
end

API_KEY = 'api_key'.freeze
CONFIGURATION = {:apikey => API_KEY}.freeze
STATUS_PATH = "https://host123d1vz.cloudconvert.com/process/vCKuVn8jHoZgYlsE4NUP"