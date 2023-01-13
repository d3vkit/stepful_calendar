# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calendar, type: :model do
  it { is_expected.to have_many(:availabilities).dependent(:destroy) }
  it { is_expected.to have_many(:appointments).dependent(:destroy) }
  it { is_expected.to belong_to(:coach) }
end
