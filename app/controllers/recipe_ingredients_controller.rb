class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: %i[ show edit update destroy ]

  # GET /recipe_ingredients or /recipe_ingredients.json
  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  # GET /recipe_ingredients/1 or /recipe_ingredients/1.json
  def show
  end

  # GET /recipe_ingredients/new
  def new
    @recipe_ingredient = RecipeIngredient.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /recipe_ingredients/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])

  end

  # POST /recipe_ingredients or /recipe_ingredients.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = @recipe.recipe_ingredients.new(recipe_ingredient_params)


    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to @recipe, notice: "Recipe ingredient was successfully created." }
        format.json { render :show, status: :created, location: @recipe_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_ingredients/1 or /recipe_ingredients/1.json
  def update
    @recipe = Recipe.find(params[:recipe_id])
    respond_to do |format|
      if @recipe_ingredient.update(recipe_ingredient_params)
        format.html { redirect_to @recipe, notice: "Recipe ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1 or /recipe_ingredients/1.json
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to @recipe, notice: "Recipe ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :default_amount, :unit)
    end
end
