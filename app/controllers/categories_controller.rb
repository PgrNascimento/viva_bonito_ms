class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @tours = @category.tours.all.order("name ASC")
  end
end
