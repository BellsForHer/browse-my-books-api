class Book < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :authors
    has_and_belongs_to_many :categories
    validates :title, :summary, :image_path, :user, presence: true
end
