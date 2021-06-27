# frozen_string_literal: true

require 'thor'

require_relative 'thor/support'
require_relative 'thor/ruby'

module SublInit
  module Thor
    class CLI < ::Thor
      namespace :sublinit
      default_command :ruby

      # Supported projects languages
      include SublInit::Thor::Ruby

      no_commands do
        def invoke(task, args: [], options: {})
          super(task, args, options)
        end

        def execute(command, *options, status_code: false)
          SublInit::CLI.exec(command, options, status_code: status_code)
        end

        def within(directory, &block)
          Dir.mkdir(directory) unless File.directory?(directory)
          Dir.chdir(directory, &block)
        end
      end
    end
  end
end
