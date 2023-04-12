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
    end
end