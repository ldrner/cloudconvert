module Cloudconvert
  module Utilities
    extend self

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

    def deep_symbolize_keys(hash)
      deep_transform_keys(hash) { |key| key.to_sym rescue key }
    end

    def deep_transform_keys(hash, &block)
      _deep_transform_keys_in_object(hash, &block)
    end

    private

    def _deep_transform_keys_in_object(object, &block)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), result|
          result[yield(key)] = _deep_transform_keys_in_object(value, &block)
        end
      when Array
        object.map { |e| _deep_transform_keys_in_object(e, &block) }
      else
        object
      end
    end
  end
end