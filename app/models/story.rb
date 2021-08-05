class Story < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  has_many :images, as: :imageable
  validates :image_path, presence: true
end
