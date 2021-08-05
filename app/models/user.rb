class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ActiveModel::Validations
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :stories
  has_one  :image, as: :imageable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, :password, :email, presence: true
  end
