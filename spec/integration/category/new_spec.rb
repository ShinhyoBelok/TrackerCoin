require 'rails_helper'

RSpec.describe 'category/index.html.erb', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jinx', email: 'test@example.com', password: '12345678') }
  before(:each) do
    sign_in user
    visit new_group_path
  end

  it 'Shows the new category page' do
    expect(page).to have_content('NEW CATEGORY')
  end

  it 'Shows the name field' do
    expect(page).to have_selector('input[type="text"][name="group[name]"]')
  end

  it 'Shows the save button' do
    expect(page).to have_selector('input[type="submit"][name="commit"][value="Save"]')
  end

  it 'redirects me to a specif new category' do
    find('a[href="/"]').click
    expect(page).to have_current_path(root_path)
  end
end