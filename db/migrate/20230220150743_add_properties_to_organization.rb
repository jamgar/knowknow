class AddPropertiesToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :heading, :string
    add_column :organizations, :sub_heading, :string
    add_column :organizations, :background_color, :string
    add_column :organizations, :text_color, :string
  end
end
