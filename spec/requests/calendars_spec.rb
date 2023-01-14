# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/users/:user_id/calendar' do
  # This should return the minimal set of attributes required to create a valid
  # Calendar. As you add validations to Calendar, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /show' do
    let(:calendar) { create(:calendar) }
    let(:user) { calendar.coach }

    before { allow_any_instance_of(ApplicationController).to receive(:current_user) { user } }

    it 'renders a successful response' do
      get user_calendar_url(calendar.coach)

      expect(response).to be_successful
    end
  end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     it 'creates a new Calendar' do
  #       expect do
  #         post calendars_url, params: { calendar: valid_attributes }
  #       end.to change(Calendar, :count).by(1)
  #     end

  #     it 'redirects to the created calendar' do
  #       post calendars_url, params: { calendar: valid_attributes }
  #       expect(response).to redirect_to(calendar_url(Calendar.last))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new Calendar' do
  #       expect do
  #         post calendars_url, params: { calendar: invalid_attributes }
  #       end.not_to change(Calendar, :count)
  #     end

  #     it "renders a response with 422 status (i.e. to display the 'new' template)" do
  #       post calendars_url, params: { calendar: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested calendar' do
  #       calendar = Calendar.create! valid_attributes
  #       patch calendar_url(calendar), params: { calendar: new_attributes }
  #       calendar.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'redirects to the calendar' do
  #       calendar = Calendar.create! valid_attributes
  #       patch calendar_url(calendar), params: { calendar: new_attributes }
  #       calendar.reload
  #       expect(response).to redirect_to(calendar_url(calendar))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it "renders a response with 422 status (i.e. to display the 'edit' template)" do
  #       calendar = Calendar.create! valid_attributes
  #       patch calendar_url(calendar), params: { calendar: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end
end
