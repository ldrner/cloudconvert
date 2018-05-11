require 'http/form_data'
require_relative 'client_stubs'

module Cloudconvert
  module Api
    class Client
      include Cloudconvert::Api::ClientStubs

      CONVERT_PATH = 'convert'.freeze

      attr_reader :connection, :response_parser_class

      def initialize(connection, response_parser_class)
        @connection = connection
        @response_parser_class = response_parser_class
      end

      def convert(file_location, input_format, options = {})
        is_remote_file = Cloudconvert::Utilities.is_url?(file_location)
        form_data = ({
          input: is_remote_file ? :download : :upload,
          file: is_remote_file ? file_location.to_s : HTTP::FormData::File.new(file_location),
          inputformat: input_format,
          outputformat: "pdf",
          wait: false,
          download: false,
        }).merge!(options)

        response = connection.post(CONVERT_PATH, form_data)

        response_parser_class.parse(response)
      end

      def status(process_url)
        response = connection.get(process_url)

        response_parser_class.parse(response)
      end

    end
  end
end