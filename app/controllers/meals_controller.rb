class MealsController < ApplicationController
  before_action :set_meal, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /meals or /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1 or /meals/1.json
  def show
    @meal_plan = @meal.day.meal_plan
    @meal_recipe = MealRecipe.new
    @meal_recipes = @meal.meal_recipes
    @meal_ingredient = MealIngredient.new

    @meal_with_leftover = MealWithLeftover.new
    
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
    @day = @meal.day
  
  end

  # POST /meals or /meals.json
  def create
    
    
    # @meal_plan = MealPlan.find_by(params[:id])
    @meal = Meal.new(meal_params)
    # @meal.time = @meal.day.date + @meal.time.hour
    # @meal_plan = @meal.day.meal_plan
    @day = Day.find(params[:day_id])
    @meal_plan = @day.meal_plan
    # @meal_plan = MealPlan.find(params[:id])
    @meal.day = @day
    @meal_recipe = MealRecipe.new
    @meal_ingredient = MealIngredient.new
    @meal_with_leftover = MealWithLeftover.new
    
    # @meal.save

    respond_to do |format|
      if @meal.save
        
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.prepend("meallist#{@day.id}", partial: "meal",
        #     locals: { meal: @meal, meal_recipe: @meal_recipe, meal_recipes: @meal_recipes, meal_ingredient: @meal_ingredient })
        # end

        format.turbo_stream
        format.html { redirect_to @meal_plan, notice: "Meal was successfully created." }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        #format.turbo_stream { render turbo_stream: turbo_stream.replace("meal_form#{day.id}", partial: "days/simple_form", locals: { day: @day, meal_plan: @meal_plan })}

        format.turbo_stream { render turbo_stream: turbo_stream.replace("day#{@day.id}meal#{@meal.id}", partial: "meals/simple_form", locals: { meal: @meal, day: @day })}
        format.html { redirect_to @meal_plan, notice: "Error saving meal - please fill out all fields." }
        format.json { render :show, status: :created, location: @meal_plan }
      end
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    @meal_plan = @meal.day.meal_plan

    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to meal_path(@meal), notice: "Meal was successfully updated." }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end


 


  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal_plan = @meal.day.meal_plan
    @meal.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("meal#{@meal.id}") }
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
      params.require(:meal).permit(:day_id, :time, :portions, :name, :favorite, :notes, :meal_type)
    end
end
