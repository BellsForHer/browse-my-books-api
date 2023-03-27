module Api
    module v1
        class AuthorsController < Api::V1::ApplicationController
            def create
                result = Authors::Operations.new_author(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    author: result.payload,
                    status: 201
                }
                render_success(payload: payload)
            end
            def index
                authro = Author.all
                payload = {
                    authors: result.payload,
                    status: 200
                }
                render_success(payload:payload)
            end
            def show
                author = Author.find(params[:id])
                payload = {
                    authors: result.payload,
                    status: 200
                }
                render_success(paylod: payload)
            end
            def update
                result = Authors::Operations.update_author(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    author: result.payload,
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