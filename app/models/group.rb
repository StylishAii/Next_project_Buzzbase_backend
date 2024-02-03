class Group < ApplicationRecord
  mount_uploader :icon, GroupIconUploader
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_invitations, dependent: :destroy

  def invite_users(user_ids, current_user)
    user_ids.each do |user_id|
      user = User.find_by(id: user_id)
      group_invitations.create(user:, state: :pending, sent_at: Time.current) if user && current_user.following.include?(user)
    end
  end
end
