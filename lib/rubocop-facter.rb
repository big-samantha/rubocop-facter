require 'rubocop'
require 'rubocop/facter/version'
require 'rubocop/facter/inject'

module RuboCop
  module Cop
    module Facter

    end
  end
end
RuboCop::Facter::Inject.defaults!

# cops
require 'rubocop/cop/facter/require_relative'
