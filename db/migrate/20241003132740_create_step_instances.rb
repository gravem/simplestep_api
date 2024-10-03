class CreateStepInstances < ActiveRecord::Migration[7.2]
  def change
    create_table :step_instances do |t|
      t.references :checklist_instance, null: false, foreign_key: true
      t.references :step, null: false, foreign_key: true
      t.text :note
      t.datetime :completed_at

      t.timestamps
    end
  end
end
