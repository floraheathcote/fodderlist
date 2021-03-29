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
    @meal = Meal.find(params[:meal_id])
  end

  # GET /meal_ingredients/1/edit
  def edit
  end

  # POST /meal_ingredients or /meal_ingredients.json
  def create
    @meal_ingredient = MealIngredient.new(meal_ingredient_params)
    @meal_plan = @meal_ingredient.meal.day.meal_plan
    respond_to do |format|
      if @meal_ingredient.save
        format.html { redirect_to @meal_plan, notice: "Meal ingredient was successfully created." }
        format.json { render :show, status: :created, location: @meal_ingredient }
      else
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
      params.require(:meal_ingredient).permit(:meal_id, :meal_recipe_id, :ingredient_id, :quantity, :unit)
    end
end
