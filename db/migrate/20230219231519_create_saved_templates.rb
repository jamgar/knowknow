class CreateSavedTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_templates do |t|
      t.string :title
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
