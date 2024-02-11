class Notification < ApplicationRecord
  belongs_to :actor, class_name: 'User'
  has_many :user_notifications, dependent: :destroy
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :group_invitations
  # rubocop:enable Rails/HasManyOrHasOneDependent
end
