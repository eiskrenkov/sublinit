# frozen_string_literal: true

module SublInit
  module CLI
    module Sublime
      module Text
        class << self
          def open(project)
            subl(project)
          end

          private

          def subl(*command)
            SublInit::CLI.exec(:subl, *command)
          end
        end
      end
    end
  end
end
