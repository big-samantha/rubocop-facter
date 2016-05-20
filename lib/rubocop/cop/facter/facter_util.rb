module RuboCop
  module Cop
    module Facter
      # Check that custom facts do not require files in facter/util.
      # This helper has been removed in Facter > 2.0.0
      # These can be restored in extreme circumstances using the
      # WhatsARanjit/facter_ruby_libs module from the forge.
      #
      # @example
      #   # bad
      #   Facter::Util::Macaddress.standardize('eth1')
      #
      #   # good
      #   Facter::Core::Resolution.exec('ip addr show eth1|sed -n 2p').split(' ')[1]
      class FacterUtil < Cop
        # rubocop:disable Metrics/LineLength
        MSG = 'Functionality under facter/util has been mostly removed and must be implemented at the fact-level'.freeze
        # rubocop:enable Metrics/LineLength

        OLD_UTIL_NAMES = [
          'architecture',
          'collection',
          'composite_loader',
          'config',
          'confine',
          'dhcp_servers',
          'directory_loader',
          'ec2',
          'fact',
          'file_read',
          'formatter',
          'ip/windows',
          'ip',
          'loader',
          'macaddress',
          'macosx',
          'manufacturer',
          'memory',
          'netmask',
          'normalization',
          'nothing_loader',
          'operatingsystem',
          'parser',
          'partitions/linux',
          'partitions/openbsd',
          'partitions',
          'plist/generator',
          'partitions/parser',
          'plist',
          'posix',
          'processor',
          'registry',
          'resolution',
          'solaris_zones',
          'unix_root',
          'uptime',
          'values',
          'virtual',
          'vlans',
          'windows/api_types/error/process',
          'partitions/user',
          'windows',
          'windows_root',
          'wmi',
          'xendomains'
        ].freeze

        UTIL_REGEX = Regexp.new("facter\/util/(#{OLD_UTIL_NAMES.join('|')})")

        def on_send(node)
          receiver, method_name, *args = *node

          # rubocop:disable Metrics/LineLength
          add_offense(node, :selector) if method_name == :require && receiver.nil? && args.first.children.first =~ UTIL_REGEX
          # rubocop:enable Metrics/LineLength
        end
      end
    end
  end
end
