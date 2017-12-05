
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kucoin_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "kucoin_ruby"
  spec.version       = KucoinRuby::VERSION
  spec.authors       = ["lalo"]
  spec.email         = ["abelardogilm@gmail.com"]

  spec.summary       = %q{KuCoin API Gem}
  spec.description   = %q{KuCoin Ruby API Gem}
  spec.homepage      = "https://github.com/abelardogilm/kucoin_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "openssl"

  spec.add_dependency "httparty"
end
