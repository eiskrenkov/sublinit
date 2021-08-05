# frozen_string_literal: true

require_relative 'sublinit/version'

require_relative 'sublinit/core_ext/string'

require_relative 'sublinit/errors'
require_relative 'sublinit/thor'
require_relative 'sublinit/cli'
require_relative 'sublinit/context'
require_relative 'sublinit/project'

module SublInit
  def self.root
    File.join(__dir__, 'sublinit')
  end
end
