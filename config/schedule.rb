# my_first_job:
#   cron: "*/2 * * * *"
#   class: "RemoveExpiredStoriesWorker"
#   queue: Worker
every 1.minute do
  runner "StoriesCleanupJob.perform_now"
end
