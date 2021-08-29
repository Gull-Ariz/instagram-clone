# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_one_attached :profile_picture

  has_many :followeds, class_name: 'UserFollower', foreign_key: 'follower_id', dependent: :destroy

  has_many :followers, class_name: 'UserFollower', foreign_key: 'followed_id', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, length: { maximum: 100 }
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
  validates :email, presence: true
  validates :profile_picture, content_type: { in: ['image/png', 'image/gif', 'image/jpg', 'image/jpeg'], message: 'Upload Image only.' }
  validates :bio, length: { maximum: 100 }

  after_create :welcome_email

  pg_search_scope :search, against: :user_name, using: { trigram: { word_similarity: true, threshold: 0.1 } }

  def welcome_email
    UserMailer.welcome_email(self).deliver!
  end

  def accepted_followeds
    followeds.where(accepted: true).pluck(:followed_id)
  end
end
