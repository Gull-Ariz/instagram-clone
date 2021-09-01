class Story < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  has_many_attached :images
end
