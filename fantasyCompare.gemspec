# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fantasyCompare/version'

Gem::Specification.new do |spec|
  spec.name          = "fantasyCompare"
  spec.version       = FantasyCompare::VERSION
  spec.authors       = ["John Verdone"]
  spec.email         = ["jmverdone@gmail.com"]

  spec.summary       = %q{Compares fantasy players stats in a CLI}
  spec.description   = %q{A console Gem that pulls API data from the NFLs fantasy api. It then lets a user select a positon and week. After displaying the top ten players, a player can be selected to see a more detailed view of the given player}
  spec.homepage      = "https://github.com/jminterwebs/fantasyCompare"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
