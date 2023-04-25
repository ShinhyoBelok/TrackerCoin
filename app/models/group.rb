class Group < ApplicationRecord
  belongs_to :entity
  belongs_to :user
end
