class User < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  has_many :user_positions, dependent: :destroy
  has_many :positions, through: :user_positions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :password, custom_password: true, on: :create
  validates :user_id, uniqueness: true, allow_blank: true
  validates :introduction, length: { maximum: 100 }

  private

  def update_user_positions(user, position_ids)
    UserPosition.where(user: user).destroy_all
    position_ids.each do |id|
      user.user_positions.build(position_id: id)
    end
  end

end
