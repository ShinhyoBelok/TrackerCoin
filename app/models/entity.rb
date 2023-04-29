class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :group
  accepts_nested_attributes_for :group

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
