class Post < ApplicationRecord
  include ActiveModel::Validations
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many_attached :images
  validates :description, presence: true, length: { maximum: 1000 }
  validate :number_of_images

  private
  def number_of_images
    if images.length > 10
      self.errors[:base] << "Post can't contain more than 10 image."
    end
  end

end
