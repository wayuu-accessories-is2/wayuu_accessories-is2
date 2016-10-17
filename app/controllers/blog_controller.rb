class BlogController < ApplicationController
  def index
    @name_blog = "Bags blog"
    @articles = Article.all.reverse_order
  end

  def show
    @article = Article.find_by( id: params[:id] )
    @name_blog = @article.title
  end
end
