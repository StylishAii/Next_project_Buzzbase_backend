class Notification < ApplicationRecord
  belongs_to :actor, class_name: 'User'
  has_many :user_notifications, dependent: :destroy
end
