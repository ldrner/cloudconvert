module Cloudconvert
  module Helper
    def validate_keys(hash, *required_keys)
      received_keys = [required_keys].flatten - hash.keys
      raise(ArgumentError, "Required key(s): #{received_keys.join(", ")}") unless received_keys.empty?
    end
  end
end
