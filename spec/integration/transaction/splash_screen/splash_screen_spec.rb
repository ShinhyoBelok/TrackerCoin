require 'rails_helper'

RSpec.describe 'category/index.html.erb', type: :feature do
  before(:each) do
    visit '/splash_screen'
  end

  it 'Shows the logo name' do
    expect(page).to have_content('TrackerCoin')
  end

  it 'Shows the login button' do
    expect(page).to have_button('LOG IN', class: 'login', type: 'submit')
  end

  it 'Shows the signup button' do
    expect(page).to have_button('SIGN UP', class: 'signup', type: 'submit')
  end

  it 'redirects me to login page' do
    click_on 'LOG IN'
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'redirects me to signup page' do
    click_on 'SIGN UP'
    expect(page).to have_current_path(new_user_registration_path)
  end
end
