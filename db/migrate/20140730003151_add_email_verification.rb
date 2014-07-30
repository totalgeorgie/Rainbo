class AddEmailVerification < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :activation_token, null: false
      t.boolean :activated, default: false
    end
  end
end
