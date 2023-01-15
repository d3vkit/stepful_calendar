# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment do
  it { is_expected.to belong_to(:availability) }
  it { is_expected.to belong_to(:student) }

  describe '.upcoming' do
    subject { described_class.upcoming }

    let(:calendar)     { create(:calendar) }
    let(:availability) { create(:availability, :reserved, calendar:) }
    let!(:appointment) { availability.appointment }

    before { create(:availability, calendar:, start_time: 1.day.from_now) }

    it { is_expected.to match_array([appointment]) }

    context 'when the appointment availability was in the past' do
      let(:availability) { travel_to(1.day.ago) { create(:availability, calendar:) } }

      it { is_expected.to be_empty }
    end
  end
end
