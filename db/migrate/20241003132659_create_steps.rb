class CreateSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :steps do |t|
      t.references :checklist_template, null: false, foreign_key: true
      t.text :content
      t.integer :step_order

      t.timestamps
    end
  end
end
