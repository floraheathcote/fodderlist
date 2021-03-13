class MealsController < ApplicationController
  before_action :set_meal, only: %i[ show edit update destroy ]

  # GET /meals or /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1 or /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals or /meals.json
  def create
    @meal_plan = MealPlan.find_by(params[:id])
    @meal = @meal_plan.meals.new(meal_params)
    

    respond_to do |format|
      if @meal.save

        # @recipe = @meal.recipe
        #   if @recipe.present?
        #     @recipe.recipe_ingredients.each do |recipe_ingredient|
        #         @meal_ingredient = MealIngredient.new
        #         @meal_ingredient.ingredient = recipe_ingredient.ingredient
        #         @meal_ingredient.quantity = recipe_ingredient.portions
        #     end
        #   end

        format.html { redirect_to @meal_plan, notice: "Meal was successfully created." }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    @meal_plan = @meal.meal_plan

    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal_plan, notice: "Meal was successfully updated." }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal_plan = @meal.meal_plan
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meal_plan_path(@meal_plan), notice: "Meal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:meal_plan_id, :portions, :name, :recipe_id, :favorite, :notes, :meal_date, :meal_type)
    end
end
