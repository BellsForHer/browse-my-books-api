module Books
    module Operations
        def self.new_book(params, current_user)
            book = current_user.books.new(title: params[:title], summary: params[:summary], image_path: params[:image_path], category_ids: params[:category_ids], author_ids: params[:author_ids])
            return ServiceContract.success(book) if book.save
            ServiceContract.error(book.errors.full_messages)
        end
        def self.update_book(params)
            book = Book.find(params[:id])
            return ServiceContract.success(book) if book.update(title: params[:title], summary: params[:summary], image_path: params[:image_path], category_ids: params[:category_ids], author_ids: params[:author_ids])
            ServiceContract.error(book.errors.full_messages)
        end
    end
end

