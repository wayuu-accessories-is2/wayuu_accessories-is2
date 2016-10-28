class BlogCommentController < ApplicationController

  def new

    a = BlogComment.new
    a.name = params[:name]
    a.email = params[:email]
    a.comment = params[:comment]
    a.article_id = params[:article]

    a.save!

    redirect_to blog_path( @article )
  end

end
