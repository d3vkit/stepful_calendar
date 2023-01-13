# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'calendars/show' do
  before do
    assign(:calendar, Calendar.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
