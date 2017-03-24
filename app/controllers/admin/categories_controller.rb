module Admin
  class CategoriesController < ApplicationController
    layout 'admin_application'
    before_action :authenticate_user!

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to @category
      else
        flash.now[:error] = "Não foi possível criar categoria."
        render 'new'
      end
    end

    def show
      @category = Category.find(params[:id])
    end

    private
    def category_params
      params.require(:category).permit(:name)
    end

  end
end
