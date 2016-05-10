require 'spec_helper'

describe Rubocop::Facter do
  it 'has a version number' do
    expect(Rubocop::Facter::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
