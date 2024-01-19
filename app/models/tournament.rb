class Tournament < ApplicationRecord
  has_many :match_results, dependent: :destroy
end
