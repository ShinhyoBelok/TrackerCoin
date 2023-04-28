require 'rails_helper'

RSpec.describe 'category/index.html.erb', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jinx', email: 'test@example.com', password: '12345678') }
  before(:each) do
    sign_in user
    @category = Group.create(name: 'food', icon: 'https://img.icons8.com/color/48/null/kawaii-bread-1.png', user:) 
    @transaction = Entity.create(name: 'sells', amount: 22, user:)
    @transaction.group = [@category]
    @transaction2 = Entity.create(name: 'purchase', amount: 33, user:)
    @transaction2.group = [@category]
    visit group_entities_path(@category)
  end

  it 'Shows the transaction the user has created' do
    expect(page).to have_content('TRANSACTION')
  end

  it 'Shows the name of the transaction' do
    expect(page).to have_content(@transaction.name)
    expect(page).to have_content(@transaction2.name)
  end

  it 'Shows the new transaction button' do
    expect(page).to have_content('New transaction')
  end

  it 'Shows the amount area' do
    expect(page).to have_content("$#{@transaction.amount}")
    expect(page).to have_content("$#{@transaction2.amount}")
  end

  it 'Shows the total' do
    expect(page).to have_content('Total:')
    expect(page).to have_content("$#{@transaction2.amount + @transaction.amount}")
  end

  it 'redirects me to main page' do
    find('a[href="/"]').click
    expect(page).to have_current_path(root_path)
  end

  it 'redirects me to new transaction page' do
    click_on 'New transaction'
    expect(page).to have_current_path(new_group_entity_path(@category))
  end
end