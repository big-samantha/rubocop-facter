module RuboCop
  module Cop
    module Facter
      # Check that custom facts do not require files in facter/util, as they've all been removed in cfacter.
      #
      # @example
      #   # bad
      #   Facter::Util::Macaddress.standardize('eth1')
      #
      #   # good
      #   Facter::Core::Resolution.exec('ip  addr show eth1|sed -n 2p').split(' ')[1]
      class FacterUtil < Cop
        # rubocop:disable Metrics/LineLength
        MSG = 'Functionality under facter/util has been mostly removed and must be implemented at the fact-level'.freeze
        # rubocop:enable Metrics/LineLength

        def on_send(node)
          _receiver, method_name, *args = *node

          add_offense(node, :selector) if (method_name == :require && _receiver == nil && args.first.children.first =~ /facter\/util/)
        end
      end
    end
  end
end
