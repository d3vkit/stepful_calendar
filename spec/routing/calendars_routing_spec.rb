# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarsController do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/1/calendar/new').to route_to('calendars#new', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/users/1/calendar').to route_to('calendars#show', user_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/calendar/edit').to route_to('calendars#edit', user_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/1/calendar').to route_to('calendars#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/calendar').to route_to('calendars#update', user_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/calendar').to route_to('calendars#update', user_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/calendar').to route_to('calendars#destroy', user_id: '1')
    end
  end
end
