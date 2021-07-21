class ArticlesController < ApplicationController
    def index
    end

    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            @article.category_ids = article_params[:category_ids]
            redirect_to root_path, notice: 'Article was successfully created.'
        else
            redirect_to root_path, alert: 'Something went wrong, and Article was not created.'
        end
    end

    private

    def article_params
        params.require(:article).permit(:author_id, :title, :text, category_ids: [])
    end
end
