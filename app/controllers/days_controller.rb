class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /days or /days.json
  # def index
  #   @days = Day.user(current_user).today
  # end
  

  def index
    if params[:filter] == "today"
          @days = Day.user(current_user).today
          
    elsif params[:filter] == nil
          @days = Day.user(current_user)
    else
          date = params[:date]
          @days = Day.user(current_user).this_date(date)
    end
    if @days.present?
      @meal_plan = @days.first.meal_plan
    end
  end




  # GET /days/1 or /days/1.json
  def show
    @meals = @day.meals
  end

  # GET /days/new
  def new
    
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @day = @meal_plan.days.new
    @date = get_meal_plan_last_day(@meal_plan) + 1.day

  end

  # GET /days/1/edit
  def edit
  end

  # POST /days or /days.json
  def create
    
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @day = Day.new(day_params)
    @day.meal_plan = @meal_plan
    @new_meal = Meal.new

    respond_to do |format|
      if @day.save
        create_meals_for_day(@day)

        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("meal_plan#{@meal_plan.id}", partial: "meal_plans/day_in_meal_plan",
            locals: { day: @day, new_meal: @new_meal })
        end

        format.html { redirect_to meal_plan_url(@meal_plan), notice: "Day was successfully created." }
        format.json { render :show, status: :created, location: @day }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@day, partial: "days/simple_form", locals: { day: @day })}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1 or /days/1.json
  def update
    @meal_plan = @day.meal_plan
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @meal_plan, notice: "Day was successfully updated." }
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
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@day) }
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
      params.require(:day).permit(:meal_plan_id, :date, :notes)
    end
end

