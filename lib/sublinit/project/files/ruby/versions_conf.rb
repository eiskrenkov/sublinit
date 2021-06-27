# frozen_string_literal: true

module SublInit
  module Project
    module Files
      module Ruby
        class VersionsConf < SublInit::Project::Files::Templated
          FILENAME = '.versions.conf'

          def filename
            FILENAME
          end
        end
      end
    end
  end
end
