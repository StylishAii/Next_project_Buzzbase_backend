class Group < ApplicationRecord
  mount_uploader :icon, GroupIconUploader
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_invitations, dependent: :destroy

  def invite_users(group, user_ids)
    user_ids.each do |user_id|
      user = User.find_by(id: user_id)
      if user && current_api_v1_user.following.include?(user)
        group.group_invitations.create(user: user, state: 'pending', sent_at: Time.current)
      end
    end
  end
end
