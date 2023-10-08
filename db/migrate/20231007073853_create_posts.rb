class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.string :name
      t.text :caption

      t.timestamps
    end
  end
end
