class MealRecipesController < ApplicationController
  before_action :set_meal_recipe, only: %i[ show edit update destroy ]

  # GET /meal_recipes or /meal_recipes.json
  def index
    @meal_recipes = MealRecipe.all
  end

  # GET /meal_recipes/1 or /meal_recipes/1.json
  def show
  end

  # GET /meal_recipes/new
  def new
    @meal_recipe = MealRecipe.new
  end

  # GET /meal_recipes/1/edit
  def edit
  end

  # POST /meal_recipes or /meal_recipes.json
  def create
    @meal_recipe = MealRecipe.new(meal_recipe_params)
    @meal_plan = @meal_recipe.meal.day.meal_plan

    respond_to do |format|
      if @meal_recipe.save
          
        create_meal_ingredients_for_recipe(@meal_recipe)

        format.html { redirect_to @meal_plan, notice: "Meal recipe was successfully created." }
        format.json { render :show, status: :created, location: @meal_recipe }
      else
        fail
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_recipes/1 or /meal_recipes/1.json
  def update
    respond_to do |format|
      if @meal_recipe.update(meal_recipe_params)
        format.html { redirect_to @meal_recipe, notice: "Meal recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_recipe }
      else
        
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_recipes/1 or /meal_recipes/1.json
  def destroy
    @meal_plan = @meal_recipe.meal.day.meal_plan
    @meal_recipe.destroy
    respond_to do |format|
      format.html { redirect_to meal_plan_path(@meal_plan), notice: "Meal recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_recipe
      @meal_recipe = MealRecipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_recipe_params
      params.require(:meal_recipe).permit(:meal_id, :recipe_id, :portions)
    end

    def create_meal_ingredients_for_recipe(meal_recipe)
      recipe = meal_recipe.recipe
      meal = meal_recipe.meal
      # if @recipe.present?
        recipe.recipe_ingredients.each do |recipe_ingredient|
            @meal_ingredient = MealIngredient.new
            @meal_ingredient.ingredient = recipe_ingredient.ingredient
            @meal_ingredient.quantity = recipe_ingredient.default_amount
            @meal_ingredient.unit = recipe_ingredient.unit
            @meal_ingredient.meal_recipe = meal_recipe
            @meal_ingredient.meal = meal
            
            if @meal_ingredient.save
            else
              fail
            end
        # end
        end
    end
end
