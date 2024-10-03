class CreateChecklistTemplates < ActiveRecord::Migration[7.2]
  def change
    create_table :checklist_templates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end