require 'rubocop'

# core
require 'rubocop/facter/version'
require 'rubocop/facter/inject'

RuboCop::Facter::Inject.defaults!

# cops
require 'rubocop/cop/facter/require_relative'
require 'rubocop/cop/facter/facter_util'
