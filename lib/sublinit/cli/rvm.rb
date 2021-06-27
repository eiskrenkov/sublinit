# frozen_string_literal: true

module SublInit
  module CLI
    module RVM
      class << self
        def list
          rvm('list', 'rubies', 'strings').split("\n")
        end

        def use(ruby_version)
          rvm('use', ruby_version)
        end

        def create_gemset(gemset_name)
          rvm('gemset', 'create', gemset_name)
        end

        private

        def rvm(*command, status_code: false)
          SublInit::CLI.exec(:rvm, *command, status_code: status_code)
        end
      end
    end
  end
end
