class CategoriesController < ActionController::Base
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
