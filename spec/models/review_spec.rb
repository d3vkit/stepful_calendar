# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to(:appointment) }

  it { is_expected.to validate_numericality_of(:rating).is_in(1..5).only_integer }
end
