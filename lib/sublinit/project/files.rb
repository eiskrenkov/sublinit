# frozen_string_literal: true

require_relative 'files/base'
require_relative 'files/templated'

require_relative 'files/sublime_project'
require_relative 'files/ruby/versions_conf'

module SublInit
  module Project
    module Files
      class AlreadyExists < SublInit::Error
        def initialize(filename)
          super("#{filename} already exists")
        end
      end
    end
  end
end
