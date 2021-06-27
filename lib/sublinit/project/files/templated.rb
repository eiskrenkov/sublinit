# frozen_string_literal: true

require 'erb'

module SublInit
  module Project
    module Files
      class Templated < Base
        TEMPLATES_FOLDER = 'templates'

        attr_reader :options

        def initialize(options)
          @options = options
        end

        private

        def default_content
          context = SublInit::Context.new(options).get_binding
          ERB.new(template_file_content).result(context)
        end

        def template_file_content
          File.new(template_path).read
        end

        def template_path
          File.join(
            SublInit.root,
            TEMPLATES_FOLDER,
            template_filename
          )
        end

        def template_filename
          self.class.name.split('::').last(2).join('/').underscore
        end
      end
    end
  end
end
