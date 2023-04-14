class BookBlueprint < Blueprinter::Base
    identifier :id
    fields :title, :sub_title, :summary, :image_path, :user
end