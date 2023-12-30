class UserPosition < ApplicationRecord
  belongs_to :user
  belongs_to :position
end
