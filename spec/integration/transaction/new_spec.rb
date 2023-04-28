require 'rails_helper'

RSpec.describe 'category/index.html.erb', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jinx', email: 'test@example.com', password: '12345678') }
  before(:each) do
    sign_in user
    @category = Group.create(name: 'food', icon: 'https://img.icons8.com/color/48/null/kawaii-bread-1.png', user:)
    visit new_group_entity_path(@category)
  end

  it 'Shows the new transaction page' do
    expect(page).to have_content('NEW TRANSACTION')
  end

  it 'Shows the name and amount field' do
    expect(page).to have_selector('input[type="text"][name="entity[name]"]')
    expect(page).to have_selector('input[type="number"][name="entity[amount]"]')
  end

  it 'Shows the checkbox' do
    expect(page).to have_selector('input[type="checkbox"]')
    expect(page).to have_content(@category.name)
  end

  it 'Shows the save button' do
    expect(page).to have_selector('input[type="submit"][name="commit"][value="Save"]')
  end

  it 'redirects me to transaction page' do
    link = "/groups/#{@category.id}/entities"
    find("a[href='#{link}']").click
    expect(page).to have_current_path(group_entities_path(@category))
  end
end
