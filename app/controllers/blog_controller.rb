class BlogController < ApplicationController
  def index
    @name_blog = "Bags blog"
    @articles = Article.all.reverse_order
  end
end
