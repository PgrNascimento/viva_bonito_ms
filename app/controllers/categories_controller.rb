class CategoriesController < ActionController::Base
  def index
    @categories = Category.all.order(:name)
  end

  def show
    @category = Category.find(params[:id])
  end
end
