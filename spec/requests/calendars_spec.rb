# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/users/:user_id/calendar' do
  describe 'GET /show' do
    let(:calendar) { create(:calendar) }
    let(:user) { calendar.coach }

    before { allow_any_instance_of(ApplicationController).to receive(:current_user) { user } }

    it 'renders a successful response' do
      get user_calendar_url(calendar.coach)

      expect(response).to be_successful
    end
  end
end
