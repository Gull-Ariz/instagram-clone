# frozen_string_literal: true

class StoriesCleanupJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Story.where('created_at < ?', 1.minute.ago).destroy_all
  end
end
