class BlogController < ApplicationController

  #before_action :authenticate_user!
  #before_action :require_admin

  def add
    respond_to do |format|
    	format.js
    end
  end

  def new
    t = Article.new
    t.title = params['title']
    t.description = params['description']
    t.content = params['content']
    t.save!
    session[:articleid] = t.id
  end

  def index
    @name_blog = "Bags blog"
    @articles = Article.all.reverse_order
    @image = Media.all
  end

  def show
    @article = Article.find_by( id: params[:id] )
    @comments = BlogComment.where(article_id: params[:id]).order('created_at DESC')
    
  end

  def update

  end

  def change

  end


end
