class AddOrganizatinAndRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :organization, null: false, foreign_key:true, default: 1
    add_column :users, :role, :integer, default: 0
  end
end
