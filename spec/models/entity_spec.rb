require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'Jinx', email: 'test@example.com', password: '12345678') }
  let(:transaction) { Entity.create(name: 'chicken', amount: 22, user:) }

  it 'transaction should be valid' do
    expect(transaction).to be_valid
  end

  it 'if name is not present, category must not be valid' do
    transaction.name = nil
    expect(transaction).to_not be_valid
  end

  it 'if amount is not present, category must not be valid' do
    transaction.amount = nil
    expect(transaction).to_not be_valid
  end
end
