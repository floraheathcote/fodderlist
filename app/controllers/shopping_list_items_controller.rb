class ShoppingListItemsController < ApplicationController
  before_action :set_shopping_list_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :update]

  # GET /shopping_list_items or /shopping_list_items.json
  def index
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @shopping_list_items = ShoppingListItem.where(meal_plan: @meal_plan)
    @shopping_list_items_ticked = ShoppingListItem.where(meal_plan: @meal_plan, ticked: true).joins(:ingredient).order(ingredient_category_id: :asc)
    @shopping_list_items_unticked = ShoppingListItem.where(meal_plan: @meal_plan, ticked: false).joins(:ingredient).order(ingredient_category_id: :asc)
  end

  # GET /shopping_list_items/1 or /shopping_list_items/1.json
  def show

  end

  # GET /shopping_list_items/new
  def new
    @shopping_list_item = ShoppingListItem.new
    
  end

  # GET /shopping_list_items/1/edit
  def edit
    @meal_plan = @shopping_list_item.meal_plan
  end

  # POST /shopping_list_items or /shopping_list_items.json
  def create
    # @shopping_list_item = ShoppingListItem.new(shopping_list_item_params)

    # respond_to do |format|
    #   if @shopping_list_item.save
    #     format.html { redirect_to @shopping_list_item, notice: "Shopping list item was successfully created." }
    #     format.json { render :show, status: :created, location: @shopping_list_item }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def toggle_tick
    # GET shopping_list_item_toggle_tick_path
    @shopping_list_item = ShoppingListItem.find(params[:shopping_list_item_id])
    @meal_plan = @shopping_list_item.meal_plan
    if @shopping_list_item.ticked == false
      @shopping_list_item.ticked = true
      respond_to do |format|
        format.html { redirect_to meal_plan_shopping_list_items_url(@meal_plan), notice: "#{@shopping_list_item.ingredient.name} ticked off." }
        format.json { head :no_content }
      end
    else
      @shopping_list_item.ticked = false
      
      respond_to do |format|
        format.html { redirect_to meal_plan_shopping_list_items_url(@meal_plan), notice: "#{@shopping_list_item.ingredient.name} put back on list." }
        format.json { head :no_content }
      end
    end
    @shopping_list_item.save
    
  end

  # PATCH/PUT /shopping_list_items/1 or /shopping_list_items/1.json
  def update
    @meal_plan = @shopping_list_item.meal_plan
    
    respond_to do |format|
      if @shopping_list_item.update(shopping_list_item_params)
        format.js
        format.html { redirect_to meal_plan_shopping_list_items_url(@meal_plan), notice: "Shopping list item was successfully updated." }
        format.json { render :show, status: :ok, location: @shopping_list_item }
      else
        format.js
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_list_items/1 or /shopping_list_items/1.json
  def destroy
    @shopping_list_item.destroy
    respond_to do |format|
      format.html { redirect_to meal_plan_shopping_list_items_url(@meal_plan), notice: "Shopping list item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list_item
      @shopping_list_item = ShoppingListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_list_item_params
      params.require(:shopping_list_item).permit(:ingredient_id, :total_sum_unit, :ticked, :meal_plan_id)
    end
end
