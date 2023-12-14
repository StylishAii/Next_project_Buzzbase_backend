# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  VALID_PASSWORD_REGEX = /\A[a-zA-Z\d]+\z/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
