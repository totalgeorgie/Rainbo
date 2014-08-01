class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.references :subject, polymorphic: true, null: false

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :subject_id
  end
end
