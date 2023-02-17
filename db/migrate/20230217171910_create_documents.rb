class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :organization, null: false, foreign_key: true
      t.boolean :published
      t.boolean :internal, default: true
      t.string :slug, index: { unique: true }

      t.timestamps
    end
  end
end
