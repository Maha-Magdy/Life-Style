class CategoriesController < ApplicationController
    def index
        categories
    end

    def show
        @Category = Category.find(params[:id])
        @articles = @Category.articles.ordered_by_most_recent
    end

    private

    def categories
        @categories = Category.all.order(:priority)
    end
end
