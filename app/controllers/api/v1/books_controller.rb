module Api
    module V1
        class BooksController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[browse show]

            def create
                result = Books::Operations.new_book(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    book: BookBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end
            
            def index
                books = Book.all
                payload = {
                    books: BookBlueprint.render_as_hash(books),
                    status: 200
                }
                render_success(payload: payload)
            end
            def show
                book = Book.find(params[:id])
                payload = {
                    book: BookBlueprint.render_as_hash(book),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update
                result = Books::Operations.update_book(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    book: BookBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                book = Book.find(params[:id])
                book.destroy
                render_success(payload: "Book has been deleted!", status: 200)
            end

            def browse
                render_success(payload: {suggest: Book.order("RANDOM()").limit(5), categories: Category.all, usernames: User.all}) 
            end

            def library
                render_success(payload:BookBlueprint.render_as_hash(@current_user.books))
            end

        end
    end
end