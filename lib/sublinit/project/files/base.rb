# frozen_string_literal: true

module SublInit
  module Project
    module Files
      class Base
        def self.create!(*args)
          new(*args).create!
        end

        def create!
          File.write(filename, default_content)
          filename
        end

        private

        def build_full_filename(filename, extension)
          [filename, extension].join('.')
        end

        def filename
          raise NotImplementedError
        end

        def default_content
          raise NotImplementedError
        end
      end
    end
  end
end
