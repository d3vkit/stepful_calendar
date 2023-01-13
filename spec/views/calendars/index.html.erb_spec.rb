# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'calendars/index' do
  before do
    assign(:calendars, [
             Calendar.create!,
             Calendar.create!
           ])
  end

  it 'renders a list of calendars' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
