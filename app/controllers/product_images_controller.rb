class ProductImagesController < ApplicationController
  before_action :set_images, only: [:show, :edit, :update, :destroy]

   # GET /images
   # GET /images.json
  def index
   @images = ProductImage.all
  end

   # GET /images/1
   # GET /images/1.json
   def show
   end

   # GET /images/new
   def new
     @image = ProductImage.new
   end

   # GET /images/1/edit
   def edit
   end

   # POST /images
   # POST /images.json
   def create
    @image = ProductImage.new(image: params[:file])
    @image.sort_order = -1
    @image.product_id = session[:productid]
    @image.save
    #redirect_to list_product_index_path
    #respond_to do |format|
      #if @image.save
        #format.html { redirect_to @image, notice: 'Image was successfully created.' }
        #format.js { render :listproduct, status: :created, location: @image }
        #redirect_to list_product_index_path
      #else
        #format.html { render :new }
        #format.json { render json: @image.errors, status: :unprocessable_entity }
      #end
    #end
   end

   # PATCH/PUT /images/1
   # PATCH/PUT /images/1.json
   def update
     respond_to do |format|
       if @image.update(image_params)
         format.html { redirect_to @image, notice: 'Image was successfully updated.' }
         format.json { render :show, status: :ok, location: @image }
       else
         format.html { render :edit }
         format.json { render json: @image.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /images/1
   # DELETE /images/1.json
   def destroy
     @images.destroy
     render nothing: true
   end

   private
     # Use callbacks to share common setup or constraints between actions.
    def set_images
     @images = ProductImage.find(params[:id])
    end

     # Never trust parameters from the scary internet, only allow the white list through.
    def images_params
      params.require(:images).permit(:product_image_id, :image)
    end

end
