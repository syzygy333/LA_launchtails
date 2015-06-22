class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category added.'
      redirect_to '/categories'
    else
      render :new
    end
  end

  def drinks
    @category = Category.find(params[:id])
    @drinks = @category.drinks.find(params[:id])
  end

  def index
    @categories = Category.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
  end

  protected
  def category_params
    params.require(:category).permit(:name)
  end
end
