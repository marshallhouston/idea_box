class Admin::ImagesController < Admin::BaseController

  before_action :find_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
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
  end

  def update
    @image.update(image_params)
    redirect_to admin_image_path(@image)
  end

  def destroy
    @image.destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :url)
  end

  def find_image
    @image = Image.find(params[:id])
  end
end
