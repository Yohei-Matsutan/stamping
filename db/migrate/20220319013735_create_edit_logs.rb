class CreateEditLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :edit_logs do |t|
      t.integer :stamp_id
      t.integer :admin_id
      t.datetime :old_in_time
      t.datetime :old_out_time
      t.datetime :new_in_time
      t.datetime :new_out_time

      t.timestamps
    end
  end
end
