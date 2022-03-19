class CreateStamps < ActiveRecord::Migration[6.1]
  def change
    create_table :stamps do |t|
      t.integer :user_id
      t.datetime :in_time
      t.datetime :out_time

      t.timestamps
    end
  end
end
