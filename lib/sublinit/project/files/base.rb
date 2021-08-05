# frozen_string_literal: true

module SublInit
  module Project
    module Files
      class Base
        def self.create!(...)
          new(...).create!
        end

        def create!
          raise SublInit::Project::Files::AlreadyExists, filename if file_exists?

          File.write(filename, default_content)
          filename
        end

        private

        def build_full_filename(filename, extension)
          [filename, extension].join('.')
        end

        def file_exists?
          File.file?(filename)
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
