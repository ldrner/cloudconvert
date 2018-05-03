require 'http/form_data'
require 'cloudconvert/helper'

module Cloudconvert
  module Api
    class Client
      include Cloudconvert::Helper
      CONVERT_PATH = 'convert'.freeze

      attr_reader :connection, :response_parser_class

      def initialize(connection, response_parser_class)
        @connection = connection
        @response_parser_class = response_parser_class
      end

      def convert(file_location, options = {})
        validate_keys(options, :input, :inputformat)
        file_data = case options[:input].to_sym
        when :download
          file_location.to_s
        when :upload
          HTTP::FormData::File.new(file_location)
        else
          nil
        end

        form_data = ({
          outputformat: "pdf",
          wait: false,
          download: false,
          file: file_data
        }).merge!(options)


        response = connection.post(CONVERT_PATH, form_data)
        # response = OpenStruct.new({
        #   body: "{\"id\":\"cUMQTReC8BJf0PmnNkW6\",\"url\":\"//host123d1w1.cloudconvert.com/process/cUMQTReC8BJf0PmnNkW6\",\"expire\":1524947740,\"percent\":0,\"message\":\"Converting file to pdf\",\"step\":\"convert\",\"starttime\":1524946600,\"output\":{\"url\":\"//host123d1w1.cloudconvert.com/download/~-PU7_yufcQ1HLZpd0IRh9iIJhAs\"},\"input\":{\"filename\":\"2018-04-10_14-52-33.png\",\"name\":\"2018-04-10_14-52-33\",\"ext\":\"png\"},\"converter\":{\"mode\":\"convert\",\"format\":\"pdf\",\"type\":\"imagemagick\",\"options\":{\"resize\":null,\"resizemode\":\"maximum\",\"resizeenlarge\":null,\"rotate\":null,\"grayscale\":null,\"strip_metatags\":null,\"density\":null,\"auto_orient\":null,\"command\":null}},\"group\":\"image\"}",
        #   code: 200
        # })
        response_parser_class.parse(response)
      end

      def status(process_url)
        response = connection.get(process_url)
        # response = OpenStruct.new({
        #   body: "{\"id\":\"hPnsZperJHcUF1OVImGD\",\"url\":\"//host1ibn9yi.cloudconvert.com/process/hPnsZperJHcUF1OVImGD\",\"expire\":1524989224,\"percent\":100,\"message\":\"Conversion finished!\",\"step\":\"finished\",\"starttime\":1524946023,\"output\":{\"url\":\"//host1ibn9yi.cloudconvert.com/download/~8_AY3SW9cTw1J7NupuVDziUPlHk\",\"filename\":\"2018-04-10_14-52-33.pdf\",\"ext\":\"pdf\",\"size\":48331},\"input\":{\"filename\":\"2018-04-10_14-52-33.png\",\"name\":\"2018-04-10_14-52-33\",\"ext\":\"png\"},\"converter\":{\"mode\":\"convert\",\"format\":\"pdf\",\"type\":\"imagemagick\",\"options\":{\"resize\":null,\"resizemode\":\"maximum\",\"resizeenlarge\":null,\"rotate\":null,\"grayscale\":null,\"strip_metatags\":null,\"density\":null,\"auto_orient\":null,\"command\":null}},\"group\":\"image\",\"minutes\":1,\"endtime\":1524946024}",
        #   code: 200
        # })

        response_parser_class.parse(response)
      end

    end
  end
end