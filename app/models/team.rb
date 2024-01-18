class Team < ApplicationRecord
  belongs_to :category, class_name: 'BaseballCategory', optional: true
  belongs_to :prefecture, optional: true
  has_one :user, foreign_key: 'user_id', primary_key: 'id', dependent: :destroy, inverse_of: :team

  validates :name, presence: true
  validates :category_id, presence: true
  validates :prefecture_id, presence: true
end
