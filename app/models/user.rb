class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ActiveModel::Validations
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :stories

  has_many :followeds, class_name: 'User_Follower', foreign_key: 'user_id'
  has_many :followers, class_name: 'User_Follower', foreign_key: 'follower_id'

  has_one_attached  :profile_picture
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, format: { with: /\A^[A-Za-z][a-zA-Z0-9]+\z/}, length: { maximum: 100}
  validates :password, presence: true
  validates :email, presence: true, format: { with: /\A^[A-Za-z][a-zA-Z0-9]+\z/}
  end
