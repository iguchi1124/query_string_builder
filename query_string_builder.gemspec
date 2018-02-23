lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "query_string_builder/version"

Gem::Specification.new do |spec|
  spec.name          = "query_string_builder"
  spec.version       = QueryStringBuilder::VERSION
  spec.author        = "Shota Iguchi"
  spec.email         = "shota-iguchi@cookpad.com"

  spec.summary       = "Simple query string builder"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
