class BookBlueprint < Blueprinter::Base
    identifier :id
    fields :title, :summary, :image_path, :user, :authors, :categories
end