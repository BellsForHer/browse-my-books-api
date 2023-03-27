class Author < ApplicationRecord
  belongs_to :book

  validates :first_name, :last_name, presence: true
end
