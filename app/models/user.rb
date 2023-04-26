class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  attribute :photo, default: 'https://cdn3.iconfinder.com/data/icons/avatars-flat/33/man_5-512.png'
end
