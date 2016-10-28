class BlogController < ApplicationController
  def index
    @name_blog = "Bags blog"
    @articles = Article.all.reverse_order
  end

  def show
    @article = Article.find_by( id: params[:id] )
    @name_blog = @article.title
    @comments = BlogComment.where(article_id: params[:id]).order('created_at DESC')
  end
end
