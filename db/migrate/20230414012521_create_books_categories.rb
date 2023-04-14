class CreateBooksCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :books_categories do |t|

      t.timestamps
    end
  end
end
