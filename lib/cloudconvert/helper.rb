module Cloudconvert
  module Helper
    def revise_url(url)
      return '' if url.nil? || url.empty?
      uri = URI.parse(url)
      uri.scheme = 'https' if uri.scheme.nil? || uri.scheme.empty?
      uri.to_s
    end

    def file_extension(filename)
      File.extname(filename).delete('.')
    end
  end
end
