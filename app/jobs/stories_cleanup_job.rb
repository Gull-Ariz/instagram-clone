class StoriesCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Story.where('created_at < ?', 1.minute.ago).destroy_all
  end
end
