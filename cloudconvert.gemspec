
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cloudconvert/version"

Gem::Specification.new do |spec|
  spec.name          = "cloudconvert"
  spec.version       = Cloudconvert::VERSION
  spec.authors       = ["Ilia Kriachkov"]
  spec.email         = ["ilia.kriachkov@jetrockets.ru"]

  spec.summary       = %q{CloudConvert The convert API wrapper.}
  spec.description   = %q{CloudConvert The convert API wrapper. https://cloudconvert.com/api/conversions#convert}
  spec.homepage      = "https://github.com/ldrner/cloudconvert"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # a b c d e f g h i j k l m n o p q r s t u v w x y z
  spec.add_dependency 'http'
  spec.add_dependency 'http-form_data'

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
