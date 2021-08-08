class RemoveImagePathFromStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :image_path
  end
end
