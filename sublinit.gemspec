# frozen_string_literal: true

require_relative 'lib/sublinit/version'

Gem::Specification.new do |spec|
  spec.name          = 'sublinit'
  spec.version       = SublInit::VERSION

  spec.authors       = ['Egor Iskrenkov']
  spec.email         = ['e.iskrenkov@gmail.com']

  spec.summary       = 'Sublime Text CLI for new projects initialization'
  spec.homepage      = 'https://github.com/eiskrenkov/sublinit'

  spec.files         = `git ls-files`.split($RS).reject { |f| f.match(%r{^spec/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('~> 3.0.0')

  # SublInit dependencies
  spec.add_dependency 'thor', '~> 1.1.0'

  spec.add_development_dependency 'pry', '~> 0.13.1'
end
