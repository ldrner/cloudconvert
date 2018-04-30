module Cloudconvert
  module Helper
    def file_extension(filename)
      File.extname(filename).delete('.')
    end
  end
end
