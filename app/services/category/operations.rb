module Categories
    module Operations
        def self.new_category(params)
            category = categories.new(title: params[:title], book_id: params[:book_id])
            return success(category) if category.save
            category.errors.full_messages
        end

        def self.update_category(params)
            category = Category.find(params[:id])
            return ServiceContract.success(category) if category.update(title: params[:title])
            ServiceContract.error(category.errors.full_messages)
        end
    end
end