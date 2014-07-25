class CreateBoardMemberships < ActiveRecord::Migration
  def change
    create_table :board_memberships do |t|
      t.integer :board_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    
    add_index :board_memberships, [:board_id, :user_id], unique: true
  end
end
