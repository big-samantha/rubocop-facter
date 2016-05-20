module RuboCop
  module Facter
    # Central reference point for current version of rubocop-facter
    module Version
      # rubocop:disable all
      VERSION = '0.2.1'
      # rubocop:enable all

      def self.current
        VERSION
      end
    end
  end
end
