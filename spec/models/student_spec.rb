# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student do
  it { is_expected.to have_many(:appointments).dependent(:destroy) }

  it 'inherits from User' do
    expect(described_class).to inherit_from(User)
  end
end
