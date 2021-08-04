class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :description, null: false, length:{maximum: 1000}
      t.string :image_path, null: false

      t.timestamps
    end
  end
end
