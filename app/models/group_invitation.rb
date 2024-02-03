class GroupInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum state: { pending: 0, accepted: 1, declined: 2 }
end
