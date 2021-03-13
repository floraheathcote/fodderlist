class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: %i[ show edit update destroy ]

  # GET /meal_plans or /meal_plans.json
  def index
    @meal_plans = MealPlan.all
  end

  # GET /meal_plans/1 or /meal_plans/1.json
  def show
    @meal = Meal.new
    @meals = @meal_plan.meals
    @meal_plan = MealPlan.find(params[:id])
    @meal_recipe = @meal.meal_recipes.new
  end

  # GET /meal_plans/new
  def new
    @meal_plan = MealPlan.new
  end

  # GET /meal_plans/1/edit
  def edit
  end

  # POST /meal_plans or /meal_plans.json
  def create
    @meal_plan = MealPlan.new(meal_plan_params)
    @meal_plan.user = current_user

    respond_to do |format|
      if @meal_plan.save
        format.html { redirect_to @meal_plan, notice: "Meal plan was successfully created." }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_plans/1 or /meal_plans/1.json
  def update
    respond_to do |format|
      if @meal_plan.update(meal_plan_params)
        format.html { redirect_to @meal_plan, notice: "Meal plan was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_plans/1 or /meal_plans/1.json
  def destroy
    @meal_plan.destroy
    respond_to do |format|
      format.html { redirect_to meal_plans_url, notice: "Meal plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_plan
      @meal_plan = MealPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_plan_params
      params.require(:meal_plan).permit(:user_id, :start_date, :notes)
    end
end
