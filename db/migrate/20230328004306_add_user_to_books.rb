class AddUserToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :user_id, :string
  end
end
