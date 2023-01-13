# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coach, type: :model do
  it 'inherits from User' do
    expect(Coach).to inherit_from(User)
  end
end
