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
    t.name = params['name']
    t.title = params['title']
    t.description = params['description']
    t.content[0] = params['content']
    t.img_reference = params['image']
    #count = 0
    #length = @article.params['content'].length
    t.save!
  end

  def index
    @name_blog = "Bags blog"
    @articles = Article.all.reverse_order
  end

  def show
    @article = Article.find_by( id: params[:id] )
    @name_blog = @article.title
  end

  def change

  end


end
