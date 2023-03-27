class Book < ApplicationRecord
    has_many :authors
    validates :title, :sub_title, :summary, :image_path, presence: true
end
