class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update destroy ]

  # GET /days or /days.json
  def index
    @days = Day.all
  end

  # GET /days/1 or /days/1.json
  def show
  end

  # GET /days/new
  def new
    @meal_plan = MealPlan.find_by(params[:id])
    @day = @meal_plan.days.new
    @date = get_meal_plan_last_day(@meal_plan) + 1.day

  end

  # GET /days/1/edit
  def edit
  end

  # POST /days or /days.json
  def create
    @meal_plan = MealPlan.find_by(params[:id])
    @day = @meal_plan.days.new(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to @meal_plan, notice: "Day was successfully created." }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1 or /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @day, notice: "Day was successfully updated." }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1 or /days/1.json
  def destroy
    @meal_plan = @day.meal_plan
    @day.destroy
    respond_to do |format|
      format.html { redirect_to meal_plan_path(@meal_plan), notice: "Day was successfully destroyed." }
      format.json { head :no_content }
    end

    # TODO create/call method in MealPlan model to update start date - check that start date = meal_plan.days.date - min value
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_params
      params.require(:day).permit(:meal_plan_id, :date)
    end
end
