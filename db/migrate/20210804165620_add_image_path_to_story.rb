class AddImagePathToStory < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :image_path, :string
  end
end
