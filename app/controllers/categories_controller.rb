class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @tours = @category.tours.all.order("name ASC")
  end
end
