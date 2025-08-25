# frozen_string_literal: true

require_relative "lib/llm/spell/version"

Gem::Specification.new do |spec|
  spec.name = "llm-spell"
  spec.version = LLM::Spell::VERSION
  spec.authors = ["Antar Azri", "0x1eef"]
  spec.email = ["azantar@proton.me", "0x1eef@proton.me"]

  spec.summary = "llm-spell is a command-line utility that " \
                 "can correct spelling mistakes with the help " \
                 "of a Large Language Model (LLM). Compared to " \
                 "traditional spell checkers like `aspell` and `hunspell`, " \
                 "llm-spell often produces fewer false positives and more " \
                 "accurate suggestions."
  spec.description = spec.summary
  spec.homepage = "https://github.com/llmrb/llm-spell"
  spec.license = "0BSD"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir[
    "README.md", "LICENSE",
    "lib/*.rb", "lib/**/*.rb",
    "libexec/*", "libexec/**/*",
    "bin/*", "llm-spell.gemspec"
  ]
  spec.require_paths = ["lib"]
  spec.executables = ["llm-spell"]
  spec.add_dependency "llm.rb", "~> 0.14"
  spec.add_development_dependency "webmock", "~> 3.24.0"
  spec.add_development_dependency "yard", "~> 0.9.37"
  spec.add_development_dependency "kramdown", "~> 2.4"
  spec.add_development_dependency "webrick", "~> 1.8"
  spec.add_development_dependency "test-cmd.rb", "~> 0.12.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", "~> 1.40"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "dotenv", "~> 2.8"
end
