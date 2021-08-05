class Post < ApplicationRecord
  include ActiveModel::Validations
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :images, as: :imageable
  validates :description, presence: true, length:{maximum: 1000}
end
