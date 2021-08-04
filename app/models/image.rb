class Image < ApplicationRecord
  belongs_to :post
  belongs_to :story
  belongs_to :user
  belongs_to :imageable, polymorphic: true
end
