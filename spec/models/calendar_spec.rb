# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calendar do
  it { is_expected.to have_many(:availabilities).dependent(:destroy) }
  it { is_expected.to have_many(:appointments).through(:availabilities) }
  it { is_expected.to belong_to(:coach) }

  describe '.scoped_availabilites' do
    subject { calendar.scoped_availabilities(user) }

    let(:calendar) { create(:calendar) }
    let(:availability) { create(:availability, calendar:, reserved:) }

    context 'when given a Coach user' do
      let(:user) { create(:coach) }

      context 'when there are reserved availabilities' do
        let(:reserved) { true }

        it { is_expected.to match_array([availability]) }
      end

      context 'when there are unreserved availabilities' do
        let(:reserved) { false }

        it { is_expected.to match_array([availability]) }
      end

      context 'when there are no availabilities' do
        it { is_expected.to be_empty }
      end
    end

    context 'when given a Student user' do
      let(:user) { create(:student) }

      context 'when there are reserved availabilities' do
        let(:reserved) { true }

        it { is_expected.to be_empty }
      end

      context 'when there are unreserved availabilities' do
        let(:reserved) { false }

        it { is_expected.to match_array([availability]) }
      end

      context 'when there are no availabilities' do
        it { is_expected.to be_empty }
      end
    end
  end
end
