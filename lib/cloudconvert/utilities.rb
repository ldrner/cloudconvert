module Cloudconvert
  module Utilities
    def validate_keys(hash, *required_keys)
      received_keys = [required_keys].flatten - hash.keys
      raise(ArgumentError, "Required key(s): #{received_keys.join(", ")}") unless received_keys.empty?
    end
    module_function :validate_keys

    def is_url?(location)
      return false unless location.respond_to? :match
      !!location.match(%r[^https?://])
    end
    module_function :is_url?

    def revise_url(url)
      return if url.nil? || url.empty?
      uri = URI.parse(url)
      uri.scheme = 'https' if uri.scheme.nil? || uri.scheme.empty?
      uri.to_s
    end
    module_function :revise_url

    def deep_symbolize_keys(hash)
      deep_transform_keys(hash) { |key| key.to_sym rescue key }
    end
    module_function :deep_symbolize_keys

    private

    def deep_transform_keys(object, &block)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), result|
          result[yield(key)] = deep_transform_keys(value, &block)
        end
      when Array
        object.map { |e| deep_transform_keys(e, &block) }
      else
        object
      end
    end
    module_function :deep_transform_keys
  end
end