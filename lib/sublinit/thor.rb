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

      def initialize(args = [], local_options = {}, config = {})
        super
        @operations_count = 0
      end

      no_commands do
        def invoke(task, args: [], options: {})
          super(task, args, options)
        end

        def say(message, options = {})
          SublInit::CLI::IO.say('[THOR] ', color: :pink, newline: false)
          SublInit::CLI::IO.say(message, **{ color: :yellow }.merge(options))
        end

        def operation(description, options = {})
          return unless options.fetch(:if, true)

          @operations_count += 1
          say("#{@operations_count}. #{description}...")

          yield
        rescue SublInit::Error => e
          say(e.message, color: :red)
          nil
        end

        def execute(command, *options, status_code: false)
          SublInit::CLI.exec(command, options, status_code: status_code)
        end

        def within(directory, options = {}, &block)
          return block.call unless options.fetch(:if, true)

          Dir.mkdir(directory) unless File.directory?(directory)
          Dir.chdir(directory, &block)
        end
      end
    end
  end
end
