class BookBlueprint < Blueprinter::Base
    indentifier :id
    fields :title, :sub_title, :summary, :image_path
end