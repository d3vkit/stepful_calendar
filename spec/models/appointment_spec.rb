# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment do
  it { is_expected.to belong_to(:availability) }
  it { is_expected.to belong_to(:student) }

  describe '.upcoming' do
    subject { described_class.upcoming }

    let(:calendar) { create(:calendar) }
    let(:reserved) { create(:availability, calendar:, reserved: true) }
    let!(:appointment) { create(:appointment, availability: reserved) }

    before { create(:availability, calendar:, reserved: false, start_time: 1.day.from_now) }

    it { is_expected.to match_array([appointment]) }

    context 'when the appointment availability was in the past' do
      let(:reserved) { travel_to(1.day.ago) { create(:availability, calendar:, reserved: true) } }

      it { is_expected.to be_empty }
    end
  end
end
