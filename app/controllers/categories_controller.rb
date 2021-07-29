class CategoriesController < ApplicationController
  def index
    categories
    @featued_article = Article.all.joins(:votes).group('articles.id').order('count(articles.id) DESC').first
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.ordered_by_most_recent
  end

  private

  def categories
    @categories = Category.all.order(:priority).includes(:articles)
  end
end
