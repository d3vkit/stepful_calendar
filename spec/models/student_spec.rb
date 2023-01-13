# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_many(:appointments).dependent(:destroy) }

  it 'inherits from User' do
    expect(Student).to inherit_from(User)
  end
end
