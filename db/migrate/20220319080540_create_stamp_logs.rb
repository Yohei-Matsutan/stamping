class CreateStampLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :stamp_logs do |t|
      t.integer :user_id
      t.string :stamp_id
      t.datetime :old_in_time
      t.datetime :old_out_time
      t.datetime :new_in_time
      t.datetime :new_out_time

      t.timestamps
    end
  end
end
