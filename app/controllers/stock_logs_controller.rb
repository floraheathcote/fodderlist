class StockLogsController < ApplicationController
  before_action :set_stock_log, only: %i[ show edit update destroy ]

  # GET /stock_logs or /stock_logs.json
  def index
    @stock_logs = StockLog.all
  end

  # GET /stock_logs/1 or /stock_logs/1.json
  def show
  end

  # GET /stock_logs/new
  def new
    @stock_log = StockLog.new

    if params[:meal_recipe_id].present? 
      @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
      @url = meal_recipe_stock_logs_path(@meal_recipe)
      @meal_plan = @meal_recipe.meal.day.meal_plan
      @cancel_url = @meal_plan
      
    end
  end

  # GET /stock_logs/1/edit
  def edit
  end

  # POST /stock_logs or /stock_logs.json
  def create
    @stock_log = StockLog.new(stock_log_params)
    @meal_recipe = MealRecipe.find(params[:meal_recipe_id])
    @meal = @meal_recipe.meal
    @recipe = @meal_recipe.recipe
    @meal_plan = @meal.day.meal_plan

    @stock_log.recipe = @recipe
    @stock_log.user = current_user
    @stock_log.datetime = @meal.time
    @stock_log.meal_recipe = @meal_recipe


    respond_to do |format|
      if @stock_log.save
        if @stock_log.portions >= 0
          format.html { redirect_to @meal_plan, notice: "Leftovers added to your stores & available for future meals" }
          format.json { render :show, status: :created, location: @meal_plan }
        else
          format.html { redirect_to @meal_plan, notice: "Leftovers removed from stores" }
          format.json { render :show, status: :created, location: @meal_plan }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_logs/1 or /stock_logs/1.json
  def update
    respond_to do |format|
      if @stock_log.update(stock_log_params)
        format.html { redirect_to @stock_log, notice: "Stock log was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_logs/1 or /stock_logs/1.json
  def destroy
    @stock_log.destroy
    respond_to do |format|
      format.html { redirect_to stock_logs_url, notice: "Stock log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_log
      @stock_log = StockLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_log_params
      params.require(:stock_log).permit(:user_id, :recipe_id, :datetime, :portions, :meal_recipe_id)
    end
end
