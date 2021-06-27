# frozen_string_literal: true

module SublInit
  module CLI
    module Git
      class << self
        def init
          git('init')
        end

        private

        def git(*command)
          SublInit::CLI.exec(:git, *command)
        end
      end
    end
  end
end
