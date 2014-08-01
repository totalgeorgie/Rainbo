class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.integer :list_id, null: false
      t.text :description
      t.datetime :completion_date
      t.integer :points, default: 0, null: false
      t.integer :card_type, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.float :ord, default: 0, null: false

      t.timestamps
    end
    
    add_index :cards, :list_id
  end
end