class BlogController < ApplicationController

  #before_action :authenticate_user!
  #before_action :require_admin

  def add
    respond_to do |format|
    	format.js
    end
  end

  def new

  end

  def index
    @name_blog = "Bags blog"
    @articles = Article.all.reverse_order
  end

  def show
    @article = Article.find_by( id: params[:id] )
    @name_blog = @article.title
    @comments = BlogComment.where(article_id: params[:id]).order('created_at DESC')
    @replies = []
    @comments.each do |t|
      replies = BlogCommentReply.where(blog_comment_id: t.id)
      @replies += replies
    end

  end

end
