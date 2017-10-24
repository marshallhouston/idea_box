class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to admin_category_path(category)
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:success] = "Successfully created new category."
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
