# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Availability do
  it { is_expected.to belong_to(:calendar) }

  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }

  describe 'time slot validation' do
    subject(:errors) { availability.errors }

    let(:availability) { build(:availability, calendar:, start_time: new_start_time, end_time: new_end_time) }

    let!(:calendar) { create(:calendar) }

    let(:new_start_time) { 1.hour.from_now }
    let(:new_end_time)   { new_start_time + 2.hours }

    context 'when the start time is not in the future' do
      let(:new_start_time) { Time.current }

      it 'adds an error to start time' do
        availability.valid?

        expect(errors[:start_time]).to include('must be in the future')
      end
    end

    context 'when the end time is not in the future' do
      let(:new_end_time) { Time.current }

      it 'adds an error to end time' do
        availability.valid?

        expect(errors[:end_time]).to include('must be in the future')
      end
    end

    context 'when the requested time slot is less than two hours long' do
      let(:new_start_time) { 1.hour.from_now }
      let(:new_end_time)   { new_start_time + 2.hours - 1.minute }

      it 'adds errors to time_slot' do
        availability.valid?

        expect(errors[:time_slot]).to include('must be exactly two hours long')
      end
    end

    context 'when the requested time slot is more than two hours long' do
      let(:new_start_time) { 1.hour.from_now }
      let(:new_end_time)   { new_start_time + 2.hours + 1.minute }

      it 'adds errors to time_slot' do
        availability.valid?

        expect(errors[:time_slot]).to include('must be exactly two hours long')
      end
    end

    context 'when the requested time slot is exactly two hours long' do
      let(:new_start_time) { 1.hour.from_now }
      let(:new_end_time)   { new_start_time + 2.hours }

      it 'adds errors to time_slot' do
        availability.valid?

        expect(errors[:time_slot]).to be_empty
      end
    end

    context 'when there is an existing availability' do
      let!(:existing) { create(:availability, calendar:, start_time: existing_start_time, end_time: existing_end_time) }

      context 'when the existing availability timeslot ends before the new one begins' do
        let(:existing_start_time) { 1.hour.from_now }
        let(:existing_end_time)   { existing_start_time + 2.hours }
        let(:new_start_time)      { existing_end_time + 1.minute }
        let(:new_end_time)        { new_start_time + 2.hours }

        it 'does not have add errors to time_slot' do
          availability.valid?

          expect(errors[:time_slot]).to be_empty
        end
      end

      context 'when the existing availability timeslot begins before the new one ends' do
        let(:existing_start_time) { 2.hours.from_now }
        let(:existing_end_time)   { existing_start_time + 2.hours }
        let(:new_start_time)      { 1.hour.from_now }
        let(:new_end_time)        { new_start_time + 2.hours }

        it 'adds errors to time_slot' do
          availability.valid?

          expect(errors[:time_slot]).to include('can not overlap other availability')
        end
      end

      context 'when the new availability times are not set' do
        let(:existing_start_time) { 2.hours.from_now }
        let(:existing_end_time)   { existing_start_time + 2.hours }
        let(:new_start_time)      { nil }
        let(:new_end_time)        { nil }

        it 'adds errors to time_slot' do
          availability.valid?

          expect(errors[:time_slot]).not_to include('can not overlap other availability')
        end
      end
    end
  end
end
