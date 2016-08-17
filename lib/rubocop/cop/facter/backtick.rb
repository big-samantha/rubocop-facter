module RuboCop
  module Cop
    module Facter
      # Check that custom facts do not use backticks to run commands.
      # Backticks ignore the confine statements in facts, and will
      # run regardless of constraints
      #
      # @example
      #   # bad
      #   eth1_string = `ip addr show eth1`
      #
      #   # good
      #   eth1_string = Facter::Core::Resolution.exec('ip addr show eth1')
      class Backtick < Cop
        # rubocop:disable Metrics/LineLength
        MSG = 'Backticks should be avoided for command execution in facts, use Facter::Core::Resolution.exec'.freeze
        # rubocop:enable Metrics/LineLength

        def on_send(node)
          _receiver, method_name, *args = *node

          add_offense(node, :selector) if (method_name == :require && _receiver == nil && args.first.children.first =~ /`/)
        end
      end
    end
  end
end
