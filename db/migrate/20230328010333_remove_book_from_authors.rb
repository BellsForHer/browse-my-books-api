class RemoveBookFromAuthors < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :book_id, :string
  end
end
