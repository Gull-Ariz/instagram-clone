# frozen_string_literal: true

every 1.minute do
  rake 'stories:delete_story'
end
