# frozen_string_literal: true

require_relative 'cli/io'
require_relative 'cli/git'
require_relative 'cli/rvm'
require_relative 'cli/sublime'

module SublInit
  module CLI
    class << self
      def exec(command, *options, status_code: false)
        full_command = "#{command} #{options.join(' ')}"

        SublInit::CLI::IO.say('[CLI] ', color: :pink, newline: false)
        SublInit::CLI::IO.say("Executing '#{full_command}'", color: :blue)

        status_code ? system(full_command) : `#{full_command}`.strip
      end
    end
  end
end
