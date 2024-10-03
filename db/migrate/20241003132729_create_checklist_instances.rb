class CreateChecklistInstances < ActiveRecord::Migration[7.2]
  def change
    create_table :checklist_instances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :checklist_template, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
