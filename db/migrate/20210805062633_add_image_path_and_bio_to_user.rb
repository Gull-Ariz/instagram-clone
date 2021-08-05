class AddImagePathAndBioToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_path, :string
    add_column :users, :bio, :string
  end
end
