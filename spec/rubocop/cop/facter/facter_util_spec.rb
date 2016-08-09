describe RuboCop::Cop::Facter::FacterUtil do
  include CopSharedExamples

  subject(:cop) { described_class.new }

  context 'when util inclusion not found' do
    let(:source) do
      <<-EOS
        Facter::Core::Resolution.exec('ip  addr show eth1|sed -n 2p').split(' ')[1]
      EOS
    end

    include_examples 'does not report any offenses'
  end

  context 'when util inclusion found' do
    let(:source) do
      <<-EOS
        require 'facter/util/ip'
      EOS
    end
    let(:expected_offenses) do
      [{
        # rubocop:disable Metrics/LineLength
        message: 'Functionality under facter/util has been mostly removed and must be implemented at the fact-level',
        # rubocop:enable Metrics/LineLength
        severity: :convention,
        line: 1,
        column: 8,
        source: 'require'
      }]
    end

    include_examples 'reports offenses'
  end
end
