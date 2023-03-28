class Book < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :authors
    validates :title, :sub_title, :summary, :image_path, presence: true
end
