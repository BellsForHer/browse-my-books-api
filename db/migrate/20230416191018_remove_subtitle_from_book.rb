class RemoveSubtitleFromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :sub_title, :string
  end
end
