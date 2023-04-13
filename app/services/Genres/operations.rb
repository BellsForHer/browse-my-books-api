module Genres
    module Operations
        def self.new_genre(params)
            genre = genres.new(name: params[:name], book_id: params[:book_id])
            return success(genre) if genre.save
            genre.errors.full_messages
        end

        def self.update_genre(params)
            genre = Genre.find(params[:id])
            return ServiceContract.success(genre) if genre.update(name: params[:name])
            ServiceContract.error(genre.errors.full_messages)
        end
    end
end