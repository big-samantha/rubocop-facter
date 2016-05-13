module RuboCop
  module Cop
    module Facter
      # Check that custom facts do no use require_relative, as many Puppet deployments
      # may be using a version of Ruby that doesn't support it. require_relative was
      # introduced in Ruby 1.9.3, but many Puppet installations still use 1.8.7, as this
      # is the default version supplied with RHEL 6
      #
      # @example
      #   # bad
      #   require_relative 'helpers/custom_fact_helper'
      #
      #   # good
      #   require 'helpers/custom_fact_helper'
      class RequireRelative < Cop
        # rubocop:disable Metrics/LineLength
        MSG = 'Avoid use of `require_relative` as it is not supported in Ruby 1.8.7, still used in many Puppet deployments'.freeze
        # rubocop:enable Metrics/LineLength

        def on_send(node)
          _receiver, method_name, *args = *node

          add_offense(node, :selector) if (method_name == :require_relative && _receiver == nil)
        end
      end
    end
  end
end
