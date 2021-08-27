# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images

  validates :description, presence: true, length: { maximum: 1000 }
  #validates :images, content_type: { in: ['image/png', 'image/gif', 'image/jpeg', 'image/jpg'], message: 'Upload image only.' }
  validate :number_of_images

  private

  def number_of_images
    errors[:base] << "Post can't contain more than 10 image." if images.length > 10
  end
end
