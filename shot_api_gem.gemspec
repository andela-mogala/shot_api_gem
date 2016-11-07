# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shot_api_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "shot_api_gem"
  spec.version       = ShotApiGem::VERSION
  spec.authors       = ["Michael Ogala"]
  spec.email         = ["michael.ogala@andela.com"]

  spec.summary       = %q{Pull data from turbo-url api}
  spec.description   = %q{Interacts with the exposed api of turbo-url }
  spec.homepage      = "https://github.com/andela-mogala/shot_api_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "faker"
  spec.add_dependency 'rest-client', '~> 2.0'
end
