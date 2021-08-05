class Image < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :post
  belongs_to :story
  belongs_to :user
  belongs_to :imageable, polymorphic: true
  validates :path, presence: true
end
