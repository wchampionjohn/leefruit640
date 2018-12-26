class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @categories = Article::Category.all
  end
end
