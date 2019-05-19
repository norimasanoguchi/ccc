class ChangeCulumnTelOnUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :tel, :string
  end

  def down
    change_column :users, :tel, :integer
  end
end
