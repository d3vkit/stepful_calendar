# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_inclusion_of(:type).in_array(%w[Coach Student]) }
end
