class MealRecipesController < ApplicationController
  before_action :set_meal_recipe, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /meal_recipes or /meal_recipes.json
  def index
    @meal_recipes = MealRecipe.all
  end

  # GET /meal_recipes/1 or /meal_recipes/1.json
  def show
    @meal = @meal_recipe.meal
    @meal_plan = @meal.day.meal_plan
    @leftover = Leftover.meal_recipe(@meal_recipe).first
    @meal_ingredient = MealIngredient.new
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
    @meal = @meal_recipe.meal
    # @leftover = Leftover.user(current_user).includes(:meal_recipe)
    
    if @meal_recipe.recipe.present?
      @meal_recipe.portions = @meal_recipe.recipe.portions
    end

    respond_to do |format|
      
      if @meal_recipe.recipe.present? && @meal_recipe.save
          
        create_meal_ingredients_for_recipe(@meal_recipe)

        format.turbo_stream
        format.html { redirect_to @meal_plan, notice: "Meal recipe was successfully created." }
        format.json { render :show, status: :created, location: @meal_recipe }
      else
        format.html { redirect_to @meal_plan, notice: "Meal recipe not added, please select recipe from list" }
        format.json { render :show, status: :created, location: @meal_recipe }
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
      format.turbo_stream { render turbo_stream: turbo_stream.remove("meal_recipe#{@meal_recipe.id}") }
      format.html { redirect_to meal_plan_path(@meal_plan), notice: "Meal recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def double_portions
    multiply_portions_and_ingredients(2)

    respond_to do |format|
      format.html { redirect_to meal_recipe_path(@meal_recipe), notice: "Portions and ingredient amounts updated" }
      format.json { head :no_content }
    end
  end

  def half_portions
    multiply_portions_and_ingredients(0.5)
    respond_to do |format|
      format.html { redirect_to meal_recipe_path(@meal_recipe), notice: "Portions and ingredient amounts updated" }
      format.json { head :no_content }
    end
  end

  def add_one_portion
    @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
    @portions = @meal_recipe.portions
    ratio_increase = 1 + 1/@portions

    multiply_portions_and_ingredients(ratio_increase)

    respond_to do |format|
      format.html { redirect_to meal_recipe_path(@meal_recipe), notice: "Portions and ingredient amounts updated" }
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
      meal_plan = meal.day.meal_plan
      # if @recipe.present?
        recipe.recipe_ingredients.each do |recipe_ingredient|
            @meal_ingredient = MealIngredient.new
            @meal_ingredient.ingredient = recipe_ingredient.ingredient
            @meal_ingredient.quantity = recipe_ingredient.quantity
            @meal_ingredient.unit = recipe_ingredient.unit
            @meal_ingredient.preparation = recipe_ingredient.preparation
            @meal_ingredient.meal_recipe_id = meal_recipe.id
            @meal_ingredient.meal = meal
            @meal_ingredient.recipe_ingredient_id = recipe_ingredient.id
            @meal_ingredient.meal_plan_id = meal_plan.id
            
            if @meal_ingredient.save
            else
              fail
            end
        # end
        end
    end


    def multiply_portions_and_ingredients(multiply_by)
      @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
      @meal_plan = @meal_recipe.meal.day.meal_plan
      meal_ingredients = @meal_recipe.meal_ingredients
      @meal_recipe.portions *= multiply_by

      if @meal_recipe.save
          meal_ingredients.each do |meal_ingredient|
            meal_ingredient.quantity *= multiply_by
            meal_ingredient.save
          end
      end
    end  

end
