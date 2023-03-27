module Books
    module Operations
        def self.new_author(params, current_user)
            author = current_user.authors.new(first_name: params[:first_name], last_name[:last_name])
            return ServiceContract.success(author) if author.save
            ServiceContract.error(author.errors.full_messages)
        end
        def self.update_author(params)
            author = Author.find(params[:id])
            return ServiceContract.success(author) if author.update(first_name: params[:first_name], last_name[:last_name])
            ServiceContract.error(author.errors.full_messages)
        end
    end
end