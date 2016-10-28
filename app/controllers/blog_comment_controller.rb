class BlogCommentController < ApplicationController

  def new
    @name = params[:name]
    @email = params[:email]
    @comment = params[:comment]
    @article = params[:article]
    @blogComment = params[:comment]

    a = BlogComment.new
    a.name = @name
    a.email = @email
    a.comment = @comment
    a.article_id = @article

    a.save!

    redirect_to blog_path( @article )
  end

end
