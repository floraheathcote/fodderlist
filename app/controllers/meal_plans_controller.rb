require 'rest_client'

class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /meal_plans or /meal_plans.json
  def index
    @meal_plans = current_user.meal_plans
    @days = current_user.days


  end

  # GET /meal_plans/1 or /meal_plans/1.json
  def show
    
    @new_meal = Meal.new
    @days = @meal_plan.days.order(date: :asc)
    @meals = @meal_plan.meals.order(time: :desc)
    
    @new_meal_recipe = MealRecipe.new

    # @active_record_ingredients =  @meal_plan.all_meal_plan_ingredients
    # @array_of_hashes = @active_record_ingredients.to_a.map(&:serializable_hash)
    # @array_of_arrays = @array_of_hashes.map {|x| x.values}
    # @final_array = organised_ingredients_array(@meal_plan)

    
    @leftover = Leftover.user(current_user)
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
    start_date_from_form = @meal_plan.start_date_from_form
    number_of_days_from_form = @meal_plan.number_of_days_from_form

    respond_to do |format|
      if @meal_plan.save

        create_days(meal_plan: @meal_plan, start_date: start_date_from_form, days: number_of_days_from_form)

        format.html { redirect_to @meal_plan, notice: "Meal plan was successfully created." }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end

    @day = @meal_plan.days.new
  end

  

  # PATCH/PUT /meal_plans/1 or /meal_plans/1.json
  def update
    respond_to do |format|
      if @meal_plan.update(meal_plan_params)
        # scrollPosition = [window.scrollX, window.scrollY]
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

  def create_shopping_list
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    prev_ingredient_id = nil #@meal_plan.all_meal_plan_ingredients.last # just need a non-nil value that isn't equal to first ingredient
    
    # mi_array = MealIngredient.meal_plan(@meal_plan).group(:ingredient_id, :unit).sum(:quantity).to_a

    @meal_plan.meal_ingredient_array.each do |array_item|
      qty_unit = view_context.pluralize( round_nicely(array_item[1]), array_item[0][1] )
      if array_item[0][0] == prev_ingredient_id
        @shopping_list_item.total_sum_unit += ( " & " + qty_unit.to_s )
      else
        @shopping_list_item = ShoppingListItem.new
        @shopping_list_item.meal_plan = @meal_plan
        @shopping_list_item.ingredient = Ingredient.find(array_item[0][0])
        @shopping_list_item.total_sum_unit = qty_unit.to_s
      end

      unless @shopping_list_item.save
        fail
      end
      prev_ingredient_id = array_item[0][0]

    end

    redirect_to meal_plan_shopping_list_items_url(@meal_plan), notice: "Shopping list was successfully created."
    # format.html { redirect_to meal_plan_shopping_list_items_url(@meal_plan), notice: "Shopping list was successfully created." }
    # format.json { render :show, status: :created, location: @shopping_list_item }  
    
  end

  def delete_shopping_list
    # meal_plan_delete_shopping_list_path
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @meal_plan.shopping_list_items.delete_all

    respond_to do |format|
      format.html { redirect_to @meal_plan, notice: "Shopping list deleted and meal plan reverted to draft status." }
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
      params.require(:meal_plan).permit(:user_id, :notes, :start_date_from_form, :number_of_days_from_form)
    end

    def create_days(meal_plan:, start_date:, days:)
      (1..days.to_i).each do |int|
          @new_day = Day.new
          @new_day.date = start_date
          @new_day.date += (int - 1).days
          @new_day.meal_plan = meal_plan
          if @new_day.save
            create_meals_for_day(@new_day)
          end
        end
    end


  end

