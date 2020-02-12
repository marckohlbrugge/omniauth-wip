require File.expand_path("../lib/omniauth-wip/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marc Köhlbrugge"]
  gem.email         = ["marc@wip.chat"]
  gem.description   = "WIP (wip.chat) OAuth 2 Strategy for OmniAuth."
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/marckohlbrugge/omniauth-wip"
  gem.license       = "MIT"

  gem.add_dependency "omniauth", "~> 1.9"
  gem.add_dependency "omniauth-oauth2", "~> 1.6"
  gem.add_dependency "faraday", "~> 1.0"
  gem.add_development_dependency "bundler", "~> 1.9"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-wip"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::WIP::VERSION
end
