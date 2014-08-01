class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :board_id, null: false
      t.boolean :display_status, null: false, default: true
      t.float :ord, default: 0

      t.timestamps
    end
    add_index :lists, :board_id
  end
end