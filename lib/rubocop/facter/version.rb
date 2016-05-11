module RuboCop
  module Facter
    module Version
      # rubocop:disable all
      VERSION = '0.1.0'
      # rubocop:enable all

      def self.current
        VERSION
      end
    end
  end
end
