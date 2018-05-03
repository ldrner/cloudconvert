module Cloudconvert
  module Api
    class Response
      attr_reader :step, :output_url, :process_url

      def initialize(response_hash)
        @step = response_hash[:step]
        @process_url = Cloudconvert::Utilities.revise_url(response_hash[:url])
        @output_url = Cloudconvert::Utilities.revise_url(response_hash.fetch(:output, {}).fetch(:url, nil))
      end

      def finished?
        self.step && self.step.to_sym == :finished
      end
    end
  end
end