class Award < ApplicationRecord
  has_many :user_awards, dependent: :destroy
  has_many :users, through: :user_awards

  validates :title, presence: true
end
