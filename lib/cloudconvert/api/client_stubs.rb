require_relative '../response_parser'

module Cloudconvert
  module Api
    module ClientStubs
      def self.included(base)
        base.include ClassMethods
        # if defined?(RSpec)
        #TODO optional loading
      end

      module ClassMethods
        def unstub!
          self.define_singleton_method(:convert) { original_convert }
          self.define_singleton_method(:status) { original_status }
        end

        def stub_convert_with_success!
          self.define_singleton_method(:convert) { stub_convert_with_success }
        end

        def stub_status_with_success!
          self.define_singleton_method(:status) { stub_status_with_success }
        end

        def stub_convert_with_failure!
          self.define_singleton_method(:convert) { stub_convert_with_failure }
        end

        def stub_status_with_failure!
          self.define_singleton_method(:status) { stub_status_with_failure }
        end

        def stub_convert_with_failure(*args)
          puts "### called #stub_convert_with_failure with argsuments: #{args.join(', ')} ###"
          response = OpenStruct.new({
            body: "{\"id\":\"hs4rwbI8057MNvioafPE\",\"url\":\"//host123d1w4.cloudconvert.com/process/hs4rwbI8057MNvioafPE\",\"expire\":1526024426,\"percent\":1,\"message\":\"RocketBookError: Could not read file: test.rb. Does not contain a valid RocketBook Header.\\r\",\"step\":\"error\",\"starttime\":1526022624,\"output\":{},\"input\":{\"filename\":\"test.rb\",\"name\":\"test\",\"ext\":\"rb\"},\"converter\":{\"mode\":\"convert\",\"format\":\"pdf\",\"type\":\"calibre\",\"options\":{\"base_font_size\":null,\"outputprofile\":null,\"authors\":null,\"margin_bottom\":null,\"margin_top\":null,\"margin_left\":null,\"margin_right\":null}},\"group\":\"document\",\"endtime\":1526022626,\"minutes\":0,\"code\":422}",
            code: 422
          })
          Cloudconvert::ResponseParser.parse(response)
        end

        def stub_status_with_failure(*args)
          puts "### called #stub_status_with_failure with argsuments: #{args.join(', ')} ###"

          response = OpenStruct.new({
            body:  "{\"error\":\"Process not found\",\"code\":404}",
            code: 404
          })
          Cloudconvert::ResponseParser.parse(response)
        end

        def stub_convert_with_success(*args)
          puts "### called #stub_convert_with_success with argsuments: #{args.join(', ')} ###"

          response = OpenStruct.new({
            body: "{\"id\":\"cUMQTReC8BJf0PmnNkW6\",\"url\":\"//host123d1w1.cloudconvert.com/process/cUMQTReC8BJf0PmnNkW6\",\"expire\":1524947740,\"percent\":0,\"message\":\"Converting file to pdf\",\"step\":\"convert\",\"starttime\":1524946600,\"output\":{\"url\":\"//host123d1w1.cloudconvert.com/download/~-PU7_yufcQ1HLZpd0IRh9iIJhAs\"},\"input\":{\"filename\":\"2018-04-10_14-52-33.png\",\"name\":\"2018-04-10_14-52-33\",\"ext\":\"png\"},\"converter\":{\"mode\":\"convert\",\"format\":\"pdf\",\"type\":\"imagemagick\",\"options\":{\"resize\":null,\"resizemode\":\"maximum\",\"resizeenlarge\":null,\"rotate\":null,\"grayscale\":null,\"strip_metatags\":null,\"density\":null,\"auto_orient\":null,\"command\":null}},\"group\":\"image\"}",
            code: 200
          })
          Cloudconvert::ResponseParser.parse(response)
        end

        def stub_status_with_success(*args)
          puts "### called #stub_status_with_success with argsuments: #{args.join(', ')} ###"

          finished_process_response = OpenStruct.new({
            body: "{\"id\":\"hPnsZperJHcUF1OVImGD\",\"url\":\"//host1ibn9yi.cloudconvert.com/process/hPnsZperJHcUF1OVImGD\",\"expire\":1524989224,\"percent\":100,\"message\":\"Conversion finished!\",\"step\":\"finished\",\"starttime\":1524946023,\"output\":{\"url\":\"//host1ibn9yi.cloudconvert.com/download/~8_AY3SW9cTw1J7NupuVDziUPlHk\",\"filename\":\"2018-04-10_14-52-33.pdf\",\"ext\":\"pdf\",\"size\":48331},\"input\":{\"filename\":\"2018-04-10_14-52-33.png\",\"name\":\"2018-04-10_14-52-33\",\"ext\":\"png\"},\"converter\":{\"mode\":\"convert\",\"format\":\"pdf\",\"type\":\"imagemagick\",\"options\":{\"resize\":null,\"resizemode\":\"maximum\",\"resizeenlarge\":null,\"rotate\":null,\"grayscale\":null,\"strip_metatags\":null,\"density\":null,\"auto_orient\":null,\"command\":null}},\"group\":\"image\",\"minutes\":1,\"endtime\":1524946024}",
            code: 200
          })
          Cloudconvert::ResponseParser.parse(finished_process_response)
        end
      end
    end
  end
end