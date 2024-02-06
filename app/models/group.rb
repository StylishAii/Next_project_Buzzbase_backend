class Group < ApplicationRecord
  mount_uploader :icon, GroupIconUploader
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_invitations, dependent: :destroy

  validates :name, presence: true

  def accepted_users
    group_invitations.includes(:user).where(state: 'accepted').map(&:user)
  end
end
