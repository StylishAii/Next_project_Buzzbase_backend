class User < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  has_many :user_positions, dependent: :destroy
  has_many :positions, through: :user_positions
  belongs_to :team, foreign_key: 'user_id', primary_key: 'id', optional: true, inverse_of: :team
  has_many :user_awards, dependent: :destroy
  has_many :awards, through: :user_awards
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :follower
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :group_invitations, dependent: :destroy
  has_many :user_notifications, dependent: :destroy
  has_many :notifications, through: :user_notifications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :password, custom_password: true, on: :create
  validates :user_id, uniqueness: true, allow_blank: true
  validates :introduction, length: { maximum: 100 }

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  delegate :count, to: :following, prefix: true

  delegate :count, to: :followers, prefix: true
end
