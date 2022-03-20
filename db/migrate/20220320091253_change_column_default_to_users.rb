class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :is_admin, from: nil, to: false
    change_column_default :users, :is_on_duty, from: nil, to: false
  end
end
