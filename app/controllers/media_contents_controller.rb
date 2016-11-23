class MediaContentsController < ApplicationController
  def create
    @media = Media.new(file_name: params[:file])
    @media.article_id = session[:articleid]
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end
end
