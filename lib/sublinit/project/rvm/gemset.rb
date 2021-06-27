# frozen_string_literal: true

module SublInit
  module Project
    module RVM
      class Gemset
        attr_reader :ruby_version, :gemset_name

        def initialize(ruby_version, gemset_name)
          @ruby_version = ruby_version
          @gemset_name = gemset_name
        end

        def path
          File.join('~', '.rvm', 'gems', ruby_installation_name, 'gems')
        end

        private

        def ruby_installation_name
          "ruby-#{ruby_version}@#{gemset_name}"
        end
      end
    end
  end
end
