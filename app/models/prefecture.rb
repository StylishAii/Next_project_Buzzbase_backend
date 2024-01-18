class Prefecture < ApplicationRecord
  has_many :teams, dependent: :destroy
end
