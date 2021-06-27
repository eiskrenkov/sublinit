# frozen_string_literal: true

require 'json'

module SublInit
  module Project
    module Files
      class SublimeProject < SublInit::Project::Files::Base
        FILE_EXTENSION = 'sublime-project'

        FolderEntry = Struct.new(:name, :path, keyword_init: true) do
          def to_entry
            to_h.compact
          end
        end

        attr_reader :project_name, :additional_folder_entries

        def initialize(project_name:, additional_folders: [])
          @project_name = project_name
          @additional_folder_entries = build_additional_folder_entries(additional_folders)
        end

        private

        def filename
          build_full_filename(project_name, FILE_EXTENSION)
        end

        def default_content
          JSON.pretty_generate(build_project_hash)
        end

        def build_project_hash
          {
            folders: build_folders_array,
            settings: build_settings_hash
          }
        end

        def build_folders_array
          [
            FolderEntry.new(name: nil, path: '.').to_entry,
            *build_additional_folders_array
          ]
        end

        def build_additional_folders_array
          additional_folder_entries.map(&:to_entry)
        end

        def build_settings_hash
          {
            tab_size: 2
          }
        end

        def build_additional_folder_entries(additional_folders)
          additional_folders.map do |folder_data|
            FolderEntry.new(**folder_data)
          end
        end
      end
    end
  end
end
