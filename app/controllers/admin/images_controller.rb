class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Successfully created #{@image.name} image."
      redirect_to admin_images_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])
    image.update(image_params)
    image.save
    redirect_to admin_image_path(image)
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :url)
  end

end
