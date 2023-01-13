# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment do
  it { is_expected.to belong_to(:availability) }
  it { is_expected.to belong_to(:student) }

  describe '.upcoming' do
    subject { described_class.upcoming }

    let(:calendar) { create(:calendar) }
    let(:reserved) { create(:availability, calendar:, reserved: true, start_time: 1.hour.from_now) }
    let!(:appointment) { create(:appointment, availability: reserved) }

    before { create(:availability, calendar:, reserved: false) }

    it { is_expected.to match_array([appointment]) }

    context 'when the appointment availability was in the past' do
      let(:reserved) { create(:availability, calendar:, reserved: true, start_time: 1.hour.ago) }

      it { is_expected.to be_empty }
    end
  end
end
