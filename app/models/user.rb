class User < ActiveRecord::Base
  mount_uploader :image, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :password, custom_password: true, on: :create
  validates :user_id, uniqueness: true, allow_blank: true

  before_create :set_default_user_icon

  private

  def set_default_user_icon
    return if image.present?

    images = ['user-default-yellow.svg', 'user-default-cyan.svg', 'user-default-pink.svg', 'user-default-green.svg', 'user-default-purple.svg',
              'user-default-blue.svg']
    default_image_path = Rails.public_path.join('images', 'profile', images.sample)
    Rails.logger.debug default_image_path.to_s
    self.image = File.open(default_image_path)
  end
end
