class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
