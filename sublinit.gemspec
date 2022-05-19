# frozen_string_literal: true

require_relative 'lib/sublinit/version'

Gem::Specification.new do |spec|
  spec.name          = 'sublinit'
  spec.version       = SublInit::VERSION
  spec.license       = 'MIT'

  spec.authors       = ['Egor Iskrenkov']
  spec.email         = ['egor@iskrenkov.me']

  spec.summary       = 'Sublime Text CLI for new projects initialization'
  spec.homepage      = 'https://github.com/eiskrenkov/sublinit'

  spec.files         = Dir['lib/**/*'].select { |e| File.file?(e) }
  spec.require_paths = ['lib']

  spec.bindir        = 'bin'
  spec.executables   = spec.name

  spec.required_ruby_version = '>= 2.4.0'

  # SublInit dependencies
  spec.add_dependency 'thor', '~> 1.1.0'
end
