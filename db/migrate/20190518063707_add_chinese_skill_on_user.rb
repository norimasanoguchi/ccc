class AddChineseSkillOnUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :chinese_skill, :integer, null: false, default: 0
  end
end
