# frozen_string_literal: true

require 'sublinit/version'

require 'sublinit/core_ext/string'

require 'sublinit/errors'
require 'sublinit/thor'
require 'sublinit/cli'
require 'sublinit/context'
require 'sublinit/project'

module SublInit
  module_function

  def root
    File.join(__dir__, 'sublinit')
  end
end
