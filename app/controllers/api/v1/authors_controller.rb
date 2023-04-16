module Api
    module V1
        class AuthorsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[index ]

            def create
                author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name])
                if author.save
                    payload = {
                      author: AuthorBlueprint.render_as_hash(author),
                      status: 200
                    }
                    render_success(payload: payload)
                  else
                    render_error(errors: author.errors.full_messages, status: 400)
                  end
            end

            def index
                authors = Author.all
                payload = {
                    authors: AuthorBlueprint.render_as_hash(authors),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def show
                author = Author.find(params[:id])
                payload = {
                    author: AuthorBlueprint.render_as_hash(author),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update
                result = Authors::Operations.update_author(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    author: AuthorBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                author = Author.find(params[:id])
                author.destroy
                render_success(payload: "Author has been deleted!", status: 200)
            end

            
            
        end
    end
end