class RemoveImagePathFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image_path
  end
end
