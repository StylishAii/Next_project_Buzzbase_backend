class User < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  has_many :user_positions, dependent: :destroy
  has_many :positions, through: :user_positions
  belongs_to :team, foreign_key: 'user_id', primary_key: 'id', optional: true, inverse_of: :team

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :password, custom_password: true, on: :create
  validates :user_id, uniqueness: true, allow_blank: true
  validates :introduction, length: { maximum: 100 }
end
