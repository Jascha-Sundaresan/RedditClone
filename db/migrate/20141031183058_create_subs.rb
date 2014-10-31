class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, presence: true
      t.string :description, presence: true
      t.integer :moderator_id, presence: true

      t.timestamps
    end
    add_index :subs, :moderator_id
    add_index :subs, :title, unique: true
  end
end
