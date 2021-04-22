class MealWithLeftoversController < ApplicationController
  before_action :set_meal_with_leftover, only: %i[ show edit update destroy ]

  # GET /meal_with_leftovers or /meal_with_leftovers.json
  def index
    @meal_with_leftovers = MealWithLeftover.all
  end

  # GET /meal_with_leftovers/1 or /meal_with_leftovers/1.json
  def show
  end

  # GET /meal_with_leftovers/new
  def new
    @meal_with_leftover = MealWithLeftover.new
    @leftover = Leftover.find(params[:leftover_id])
    @meal = Meal.find(params[:meal_id])
    @url = meal_leftover_meal_with_leftovers_path(@meal, @leftover)
  end

  # GET /meal_with_leftovers/1/edit
  def edit
    @leftover = Leftover.find(params[:leftover_id])
    @url = leftover_meal_with_leftover_path(@leftover, @meal_with_leftover)
  end

  # POST /meal_with_leftovers or /meal_with_leftovers.json
  def create
    @meal_with_leftover = MealWithLeftover.new(meal_with_leftover_params)
    @leftover = Leftover.find(params[:leftover_id])
    @meal = Meal.find(params[:meal_id])
    @meal_plan = @meal.day.meal_plan

    @meal_with_leftover.leftover = @leftover
    @meal_with_leftover.meal = @meal

    respond_to do |format|
      if @meal_with_leftover.save
        format.html { redirect_to @meal_plan, notice: "Meal with leftover was successfully created." }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @meal_with_leftover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_with_leftovers/1 or /meal_with_leftovers/1.json
  def update

    # @meal = Meal.find(params[:meal_id])
    @leftover = Leftover.find(params[:leftover_id])
    @meal_plan = @leftover.meal_recipe.meal.day.meal_plan
    

    respond_to do |format|
      if @meal_with_leftover.update(meal_with_leftover_params)
        format.html { redirect_to @meal_plan, notice: "Meal with leftover was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_with_leftover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_with_leftovers/1 or /meal_with_leftovers/1.json
  def destroy
    @meal_plan = @meal_with_leftover.leftover.meal_recipe.meal.day.meal_plan
    @meal_with_leftover.destroy
    respond_to do |format|
      format.html { redirect_to meal_plan_url(@meal_plan), notice: "Leftover deleted." }
      format.json { head :no_content }
    end
  end

  def destroy_return_leftover
  @meal_with_leftover = MealWithLeftover.find(params[:meal_with_leftover_id])
  @leftover = Leftover.find(params[:leftover_id])

    @meal_with_leftover.destroy
    respond_to do |format|
      format.html { redirect_to edit_leftover_url(@leftover), notice: "Leftover deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_with_leftover
      @meal_with_leftover = MealWithLeftover.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_with_leftover_params
      params.require(:meal_with_leftover).permit(:leftover_id, :meal_id, :portions)
    end
end
