# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarsController do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/users/1/calendar').to route_to('calendars#show', user_id: '1')
    end
  end
end
