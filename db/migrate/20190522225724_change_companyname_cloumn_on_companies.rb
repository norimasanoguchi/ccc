class ChangeCompanynameCloumnOnCompanies < ActiveRecord::Migration[5.2]
  def up
    change_column :companies, :company_name, :string, null: false
    change_column :companies, :contact_person, :string, null: false
  end

  def down
    change_column :companies, :company_name, :string
    change_column :companies, :contact_person, :string
  end
end
