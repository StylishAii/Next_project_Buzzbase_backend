class BaseballCategory < ApplicationRecord
  has_many :teams, dependent: :destroy
end
