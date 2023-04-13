module Api
    module V1
        class GenresController < Api::V1::ApplicationController
            
            def create
                genre = Genre.new(name: params[:genre][:name])
                if genre.save
                    payload = {
                      genre: GenreBlueprint.render_as_hash(genre),
                      status: 200
                    }
                    render_success(payload: payload)
                  else
                    render_error(errors: genre.errors.full_messages, status: 400)
                  end
            end

            def index
                genres = Genre.all
                payload = {
                    genres: GenreBlueprint.render_as_hash(genres),
                    status: 200
                }
                render_success(payload: payload)
            end
            def show
                genre = Genre.find(params[:id])
                payload = {
                    genre: GenreBlueprint.render_as_hash(genre),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update
                result = Genres::Operations.update_genre(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    genre: GenreBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                genre = Genre.find(params[:id])
                genre.destroy
                render_success(payload: "Genre has been deleted!", status: 200)
            end

            
        end
    end
end