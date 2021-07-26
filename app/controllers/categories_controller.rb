class CategoriesController < ApplicationController
    def index
        categories
        # @articles = SELECT articles.*, COUNT(votes.id) as vote_count
        #             FROM articles
        #             INNER JOIN votes
        #             ON votes.article_id = articles.id 
        #             GROUP BY articles.id
    
        @featued_article = Article.all.joins(:votes).group("articles.id").order("count(articles.id) DESC").first

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
