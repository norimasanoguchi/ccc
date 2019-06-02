class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
    add_index :conversations, :user_id
    add_index :conversations, :company_id
    add_index :conversations, [:company_id, :user_id], unique: true
  end
end
