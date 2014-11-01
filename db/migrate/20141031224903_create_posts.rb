class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, presence: true
      t.string :url
      t.text :content
      t.integer :sub_id, presence: true
      t.integer :author_id, presence: true

      t.timestamps
    end
    add_index :posts, :sub_id
    add_index :posts, :author_id
  end
end
