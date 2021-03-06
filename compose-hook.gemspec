# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "compose-hook"
  spec.version = File.read(File.join(File.dirname(__FILE__), "VERSION")).strip
  spec.authors = ["Danylo P.", "Camille M.", "Valentine S."]
  spec.email = ["hello@heliostech.fr"]

  spec.summary = "Docker compose webhook"
  spec.description = "Simple webhook application to update a service using docker compose"
  spec.homepage = "https://www.openware.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "jwt", "~> 2.2"
  spec.add_dependency "puma"
  spec.add_dependency "rack"
  spec.add_dependency "sinatra"

  spec.add_development_dependency "bump"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "irb"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rubocop-github"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-json"
end
