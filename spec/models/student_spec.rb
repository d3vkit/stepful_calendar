# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'inherits from User' do
    expect(Student).to inherit_from(User)
  end
end
