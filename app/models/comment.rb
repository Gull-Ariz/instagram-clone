# frozen_string_literal: true

class Comment < ApplicationRecord
  # include ActiveModel::Validations
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { maximum: 1000 }
end
