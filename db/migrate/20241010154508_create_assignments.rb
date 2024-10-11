class CreateAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :assignments do |t|
      t.integer :assigner_id, null: false
      t.integer :assignee_id, null: false
      t.references :checklist_instance, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
    #  Pay attention to whether it is an assignER or an assignEE
    add_foreign_key :assignments, :users, column: :assigner_id
    add_foreign_key :assignments, :users, column: :assignee_id

    add_index :assignments, :assigner_id
    add_index :assignments, :assignee_id
  end
end
