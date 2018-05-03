module Cloudconvert
  module Helper
    def validate_keys(hash, *required_keys)
      received_keys = [required_keys].flatten - hash.keys
      raise(ArgumentError, "Required key(s): #{received_keys.join(", ")}") unless received_keys.empty?
    end

    def revise_url(url)
      return if url.nil? || url.empty?
      uri = URI.parse(url)
      uri.scheme = 'https' if uri.scheme.nil? || uri.scheme.empty?
      uri.to_s
    end
  end
end
