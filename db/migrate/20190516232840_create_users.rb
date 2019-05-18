class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 80
      t.date :birthday, null: false
      t.integer :sex, null: false, default: 0
      t.string :email, null: false, limit: 255
      t.integer :tel
      t.string :wechat_id, limit: 30
      t.integer :edu_level, default: 0
      t.integer :jlpt, default: 0
      t.boolean :management, null: false, default: false
      t.timestamps
    end
  end
end
