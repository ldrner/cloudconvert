module Cloudconvert
  class CloudconvertError < StandardError
    attr_reader :code

    def initialize(message, code)
      @code = code
      super(message)
    end

    def to_s
      super + " [#{@code}]"
    end
  end

  class APIError < CloudconvertError; end

  class AuthenticationError < StandardError; end
end