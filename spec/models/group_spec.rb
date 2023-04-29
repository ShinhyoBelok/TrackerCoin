require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Jinx', email: 'test@example.com', password: '12345678') }
  let(:category) { Group.create(name: 'chicken', icon: 'https://img.icons8.com/color/48/null/kawaii-bread-1.png', user:) }

  it 'category should be valid' do
    expect(category).to be_valid
  end

  it 'if name is not present, category must not be valid' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'if icon is not present, category must not be valid' do
    category.icon = nil
    expect(category).to_not be_valid
  end
end
