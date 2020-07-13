require_relative 'lib/collectednotes_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'collectednotes_api'
  spec.version       = CollectednotesApi::VERSION
  spec.authors       = ['Facundo Espinosa']
  spec.email         = ["facuespinosa97@gmail.com"]

  spec.summary       = 'Collected Notes API Ruby Wrapper'
  spec.description   = 'Collected Notes API Ruby Wrapper'
  spec.homepage      = 'https://github.com/faqndo97/collectednotes_api'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["source_code_uri"] = 'https://github.com/faqndo97/collectednotes_api'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'rest-client'
end
