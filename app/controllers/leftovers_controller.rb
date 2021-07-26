class LeftoversController < ApplicationController
  before_action :set_leftover, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /leftovers or /leftovers.json
  def index
    @leftovers = Leftover.all
  end

  # GET /leftovers/1 or /leftovers/1.json
  def show
  end

  # GET /leftovers/new
  def new
    @leftover = Leftover.new
    @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
    @url = meal_recipe_leftovers_path(@meal_recipe)

    @portion_limit = @meal_recipe.portions
    @meal_plan = @meal_recipe.meal.day.meal_plan
  end

  # GET /leftovers/1/edit
  def edit
    
  @meal_recipe = @leftover.meal_recipe

  @url = meal_recipe_leftover_path(@meal_recipe, @leftover)
  @meal_plan = @meal_recipe.meal.day.meal_plan
  end

  # POST /leftovers or /leftovers.json
  def create
    @leftover = Leftover.new(leftover_params)
    @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
    @leftover.meal_recipe = @meal_recipe
    @leftover.recipe = @meal_recipe.recipe
    @leftover.date_made = @meal_recipe.meal.time
    @leftover.user = current_user
    @leftover.stock_level = 0

    # @portion_limit = @meal_recipe.portions
    @meal_plan = @meal_recipe.meal.day.meal_plan

    respond_to do |format|
      if @leftover.save
        format.html { redirect_to @meal_recipe, notice: "Leftover was successfully created." }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leftover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leftovers/1 or /leftovers/1.json
  def update
    @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
    @meal_plan = @meal_recipe.meal.day.meal_plan
    
    respond_to do |format|
      if @leftover.update(leftover_params)
        format.html { redirect_to @meal_recipe, notice: "Leftover was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leftover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leftovers/1 or /leftovers/1.json
  def destroy
    @meal_plan = @leftover.meal_recipe.meal.day.meal_plan
    @meal_recipe = @leftover.meal_recipe
    @leftover.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@leftover) }
      format.html { redirect_to @meal_recipe, notice: "Leftover was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leftover
      @leftover = Leftover.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leftover_params
      params.require(:leftover).permit(:meal_recipe_id, :recipe_id, :max_portions, :stock_level, :date_made, :user_id)
    end
end
