# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Schedule management' do
  def change_to(user_type)
    visit change_user_to_path(user_type:)
  end

  let(:coach)    { create(:coach) }
  let(:student)  { create(:student) }
  let(:calendar) { create(:calendar, coach:) }
  let(:avail1)   { create(:availability, calendar:, reserved: true, start_time: 1.hour.from_now) }
  let(:avail2)   { create(:availability, calendar:, reserved: true, start_time: 3.hours.from_now) }
  let!(:app1)    { create(:appointment, availability: avail1, student:) }
  let!(:app2)    { create(:appointment, availability: avail2, student:) }

  before { driven_by(:rack_test) }

  context 'when logged in as a Coach' do
    before { change_to('Coach') }

    scenario 'Viewing the schedule' do
      visit user_schedule_path(coach)

      expect(page).to have_selector("#appointment_#{app1.id}").and \
        have_selector("#appointment_#{app2.id}")
    end

    scenario 'Viewing the schedule with no appointments' do
      app1.destroy!
      app2.destroy!
      # A different coach's appointment
      create(:appointment, student:)

      visit user_schedule_path(coach)

      expect(page).not_to have_selector('.appointment')
    end

    scenario 'Viewing the schedule with past appointments' do
      app1.availability.update!(start_time: 1.day.ago)

      visit user_schedule_path(coach)

      expect(page).not_to have_selector("#appointment_#{app1.id}")
      expect(page).to have_selector("#appointment_#{app2.id}")
    end
  end

  context 'when logged in as a Student' do
    before { change_to('Student') }

    scenario 'Viewing the schedule' do
      visit user_schedule_path(coach)

      expect(page).to have_selector("#appointment_#{app1.id}").and \
        have_selector("#appointment_#{app2.id}")
    end

    scenario "Viewing the schedule with a different coach's appointments" do
      avail3 = create(:availability, start_time: 1.hour.from_now, reserved: true)
      app3 = create(:appointment, availability: avail3, student:)

      visit user_schedule_path(coach)

      expect(page).to have_selector("#appointment_#{app1.id}").and \
        have_selector("#appointment_#{app2.id}").and \
          have_selector("#appointment_#{app3.id}")
    end

    scenario 'Viewing the schedule with past appointments' do
      app1.availability.update!(start_time: 1.day.ago)

      visit user_schedule_path(coach)

      expect(page).not_to have_selector("#appointment_#{app1.id}")
      expect(page).to have_selector("#appointment_#{app2.id}")
    end
  end
end
