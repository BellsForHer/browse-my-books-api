module Authors
    module Operations
        def self.new_author(params)
            author = authors.new(first_name: params[:first_name], last_name: params[:last_name])
            return success(author) if author.save
            author.errors.full_messages
        end

        def self.update_author(params)
            author = Author.find(params[:id])
            return ServiceContract.success(author) if author.update(first_name: params[:first_name], last_name: params[:last_name])
            ServiceContract.error(author.errors.full_messages)
        end

        # def self.author_book(params, current_user)
        #     author = authors.new(first_name: params[:first_name], last_name: params[:last_name])
        #     book = current_user.books.new(title: params[:title], sub_title: params[:sub_title], summary: params[:summary], image_path: params[:image_path])
        #     return success(author,book) if author.save && book.save
        #     author.error.full_messages
        #     book.error.full_messages
        # end
    end
end