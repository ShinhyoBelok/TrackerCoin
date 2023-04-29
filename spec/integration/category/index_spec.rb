require 'rails_helper'

RSpec.describe 'category/index.html.erb', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jinx', email: 'test@example.com', password: '12345678') }
  before(:each) do
    sign_in user
    @category = Group.create(name: 'food', icon: 'https://img.icons8.com/color/48/null/kawaii-bread-1.png', user:)
    @category2 = Group.create(name: 'sells', icon: 'https://img.icons8.com/color/48/null/kawaii-bread-1.png', user:)
    visit groups_path
  end

  it 'Shows the category the user has created' do
    expect(page).to have_content('CATEGORY')
  end

  it 'Shows the name of the categories' do
    expect(page).to have_content(@category.name)
    expect(page).to have_content(@category2.name)
  end

  it 'Shows the new category button' do
    expect(page).to have_content('New Category')
  end

  it 'Shows the amount area' do
    expect(page).to have_content('$')
  end

  it 'redirects me to a specif new category' do
    click_on 'New Category'
    expect(page).to have_current_path(new_group_path)
  end
end
