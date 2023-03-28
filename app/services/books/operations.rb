module Books
    module Operations
        def self.new_book(params, current_user)
            book = current_user.books.new(title: params[:title], sub_title: params[:sub_title], summary: params[:summary], image_path: params[:image_path])
            return ServiceContract.success(book) if book.save
            ServiceContract.error(book.errors.full_messages)
        end
        def self.update_book(params)
            book = Book.find(params[:id])
            return ServiceContract.success(book) if book.update(title: params[:title], sub_title: params[:sub_title], summary: params[:summary], image_path: params[:image_path])
            ServiceContract.error(book.errors.full_messages)
        end
    end
end