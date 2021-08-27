# frozen_string_literal: true

class Story < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  #validates :images, content_type: { in: ['image/png', 'image/gif', 'image/jpeg', 'image/jpg'], message: 'Upload image only.' }
end
