module Api
    module V1
        class CategoriesController < Api::V1::ApplicationController
            
            def create
                category = Category.new(title: params[:category][:title])
                if category.save
                    payload = {
                      category: CategoryBlueprint.render_as_hash(category),
                      status: 200
                    }
                    render_success(payload: payload)
                  else
                    render_error(errors: category.errors.full_messages, status: 400)
                  end
            end

            def index
                categories = Category.all
                payload = {
                    categories: CategoryBlueprint.render_as_hash(categories),
                    status: 200
                }
                render_success(payload: payload)
            end
            def show
                category = Category.find(params[:id])
                payload = {
                    category: CategoryBlueprint.render_as_hash(category),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update
                result = Categories::Operations.update_category(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    category: CategoryBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                category = Category.find(params[:id])
                category.destroy
                render_success(payload: "Genre has been deleted!", status: 200)
            end

            
        end
    end
end