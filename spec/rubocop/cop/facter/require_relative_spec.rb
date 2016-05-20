describe RuboCop::Cop::Facter::RequireRelative do
  include CopSharedExamples

  subject(:cop) { described_class.new }

  context 'when require_relative not present' do
    let(:source) do
      <<-EOS
        Facter::Core::Resolution.exec('ip  addr show eth1|sed -n 2p').split(' ')[1]
      EOS
    end

    include_examples 'does not report any offenses'
  end

  context 'when require_relative present' do
    let(:source) do
      <<-EOS
        require_relative 'foo/bar'
      EOS
    end
    let(:expected_offenses) do
      [{
        # rubocop:disable Metrics/LineLength
        message: 'Avoid use of `require_relative` as it is not supported in Ruby 1.8.7, still used in many Puppet deployments. An alternative could be `File.join(File.dirname(__FILE__)`',
        # rubocop:enable Metrics/LineLength
        severity: :convention,
        line: 1,
        column: 8,
        source: 'require_relative'
      }]
    end

    include_examples 'reports offenses'
  end
end
