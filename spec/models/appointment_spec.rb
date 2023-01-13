# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment do
  it { is_expected.to belong_to(:calendar) }
  it { is_expected.to belong_to(:student) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
end
