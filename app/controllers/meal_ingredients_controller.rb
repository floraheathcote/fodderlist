class MealIngredientsController < ApplicationController
  before_action :set_meal_ingredient, only: %i[ show edit update destroy ]

  # GET /meal_ingredients or /meal_ingredients.json
  def index
    @meal_ingredients = MealIngredient.all
  end

  # GET /meal_ingredients/1 or /meal_ingredients/1.json
  def show
  end

  # GET /meal_ingredients/new
  def new
    @meal_ingredient = MealIngredient.new
    


    if params[:meal_recipe_id].present?
      @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
      @url = meal_recipe_meal_ingredients_path(@meal_recipe)
      # @meal_ingredient.meal_recipe_id = @meal_recipe.id
      # @meal_ingredient.meal = @meal_recipe.meal
      # @meal_plan = @meal_recipe.meal.day.meal_plan
    elsif params[:meal_id].present?
      @meal = Meal.find(params[:meal_id])
      @url = meal_meal_ingredients_path(@meal)
      # @meal_ingredient.meal = @meal
      # @meal_plan = @meal.day.meal_plan
    end


    # if params[:meal_recipe_id].present?
    #   @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
    # elsif params[:meal_id].present?
    #   @meal = 
    # end

  end

  # GET /meal_ingredients/1/edit
  def edit
  end

  # POST /meal_ingredients or /meal_ingredients.json
  def create
    @meal_ingredient = MealIngredient.new(meal_ingredient_params)

    if params[:meal_recipe_id].present?
      @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
      @meal_ingredient.meal_recipe_id = @meal_recipe.id
      @meal_ingredient.meal = @meal_recipe.meal
      @meal_plan = @meal_recipe.meal.day.meal_plan
    elsif params[:meal_id].present?
      @meal = Meal.find(params[:meal_id])
      @meal_ingredient.meal = @meal
      @meal_plan = @meal.day.meal_plan
    end

    @meal_ingredient.meal_plan = @meal_plan
    
    respond_to do |format|
      if @meal_ingredient.save
        
        format.html { redirect_to @meal_plan, notice: "Meal ingredient was successfully created." }
        format.json { render :show, status: :created, location: @meal_ingredient }
      else
        fail
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_ingredients/1 or /meal_ingredients/1.json
  def update
    # @meal_plan = @meal_ingredient.meal

    meal_plan = @meal_ingredient.meal.day.meal_plan
    respond_to do |format|
      
      if @meal_ingredient.update(meal_ingredient_params)
        format.html { redirect_to meal_plan_url(meal_plan), notice: "Meal ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: meal_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_ingredients/1 or /meal_ingredients/1.json
  def destroy
    meal_plan = @meal_ingredient.meal.day.meal_plan
    @meal_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to meal_plan_url(meal_plan), notice: "Meal ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_ingredient
      @meal_ingredient = MealIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_ingredient_params
      params.require(:meal_ingredient).permit(:meal_id, :meal_recipe_id, :ingredient_id, :recipe_ingredient_id, :preparation, :quantity, :unit)
    end
end
