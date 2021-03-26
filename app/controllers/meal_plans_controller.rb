require 'rest_client'

class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: %i[ show edit update destroy ]

  # GET /meal_plans or /meal_plans.json
  def index
    @meal_plans = MealPlan.all
  end

  # GET /meal_plans/1 or /meal_plans/1.json
  def show
    
    @new_meal = Meal.new
    @days = @meal_plan.days.order("date ASC")
    @meals = @meal_plan.meals
    @meal_plan = MealPlan.find(params[:id])
    @new_meal_recipe = MealRecipe.new
    @active_record_ingredients =  @meal_plan.all_meal_plan_ingredients
    @array_of_hashes = @active_record_ingredients.to_a.map(&:serializable_hash)
    @array_of_arrays = @array_of_hashes.map {|x| x.values}
    @final_array = organised_ingredients_array(@meal_plan)


    # rawjson = RestClient.get 'https://www.gov.uk/bank-holidays.json'
    # @all_events = ActiveSupport::JSON.decode(rawjson)['england-and-wales']['events']
    # @response2 = @response['england-and-wales']['events'][0]
    # @response = JSON.parse(rawjson) 'england-and-wales.events[0].title'
    

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
    #   meal_plan_create_shopping_list_path
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    prev_ingredient_id = nil #@meal_plan.all_meal_plan_ingredients.last # just need a non-nil value that isn't equal to first ingredient
    @meal_plan.all_meal_plan_ingredients.each do |mpi|
      if mpi.ingredient_id == prev_ingredient_id
        @shopping_list_item.total_sum_unit += ( " & " + mpi.sum.round(0.05).to_s + " " + mpi.unit.to_s )
        # add unit
      else
        @shopping_list_item = @meal_plan.shopping_list_items.new
        @shopping_list_item.meal_plan_id = mpi.id
        @shopping_list_item.ingredient_id = mpi.ingredient_id   
        @shopping_list_item.total_sum_unit = mpi.sum.round(0.05).to_s + " " + mpi.unit.to_s
      end
        unless @shopping_list_item.save
          fail
        end
        prev_ingredient_id = mpi.ingredient_id
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

    


    def organised_ingredients_array(meal_plan)
      final_array = []
      current_line = -1
      prev_cat = ""
      prev_ing = ""
      active_record_ingredients =  meal_plan.all_meal_plan_ingredients
      array_of_hashes =  active_record_ingredients.to_a.map(&:serializable_hash)
      array_of_arrays = array_of_hashes.map {|x| x.values}

      array_of_arrays.count.times do |index|
          if @array_of_arrays[index][1] == prev_cat 
              # stay on current line
              if @array_of_arrays[index][2] == prev_ing #need to add sum & unit to current ingredient
                final_array[current_line][1][0][-1] << {sum: array_of_arrays[index][3], unit: array_of_arrays[index][4]}
              else #need to add a new ingredient, then add sum & unit to new ingredient
                  final_array[current_line][-1] << [[array_of_arrays[index][2]]] # add ingredient name
                  final_array[current_line][1][-1] << [{sum: array_of_arrays[index][3], unit: array_of_arrays[index][4]}]
                  prev_ing = array_of_arrays[index][2]
              end
          else  # increment current_line, add new category name, reset ingredient_address
              current_line +=1
              ingredient_index = 0
              final_array << [[array_of_arrays[index][1]]]  # add category name
              final_array[current_line] << [[[array_of_arrays[index][2]]]] # add ingredient name
              final_array[current_line][1][-1] << [{sum: array_of_arrays[index][3], unit: array_of_arrays[index][4]}]
              prev_cat = array_of_arrays[index][1]
              prev_ing = array_of_arrays[index][2]
          end
      end
      return final_array
    end

    


  end

