# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  after_create :welcome_email
  include ActiveModel::Validations

  pg_search_scope :search, against: :user_name, using: { trigram: { word_similarity: true, threshold: 0.1 } }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :stories, dependent: :destroy

  has_one_attached :profile_picture

  has_many :followeds, class_name: 'UserFollower', foreign_key: 'follower_id'
  has_many :followers, class_name: 'UserFollower'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, format: { with: /\A^[A-Za-z][a-zA-Z0-9]+\z/ }, length: { maximum: 100 }
  validates :password, presence: true, on: :create
  validates :email, presence: true

  def welcome_email
    UserMailer.welcome_email(self).deliver!
  end
end
