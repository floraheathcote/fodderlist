class IngredientCategoriesController < ApplicationController
  before_action :set_ingredient_category, only: %i[ show edit update destroy ]

  # GET /ingredient_categories or /ingredient_categories.json
  def index
    @ingredient_categories = IngredientCategory.order(:name)

  end

  # GET /ingredient_categories/1 or /ingredient_categories/1.json
  def show
  end

  # GET /ingredient_categories/new
  def new
    @ingredient_category = IngredientCategory.new
  end

  # GET /ingredient_categories/1/edit
  def edit
  end

  # POST /ingredient_categories or /ingredient_categories.json
  def create
    @ingredient_category = IngredientCategory.new(ingredient_category_params)

    respond_to do |format|
      if @ingredient_category.save
        format.html { redirect_to ingredient_categories_path, notice: "Ingredient category was successfully created." }
        format.json { render :show, status: :created, location: ingredient_categories_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredient_categories/1 or /ingredient_categories/1.json
  def update
    respond_to do |format|
      if @ingredient_category.update(ingredient_category_params)
        format.html { redirect_to ingredient_categories_path, notice: "Ingredient category was successfully updated." }
        format.json { render :show, status: :ok, location: ingredient_categories_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_categories/1 or /ingredient_categories/1.json
  def destroy
    @ingredient_category.destroy
    respond_to do |format|
      format.html { redirect_to ingredient_categories_url, notice: "Ingredient category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_category
      @ingredient_category = IngredientCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_category_params
      params.require(:ingredient_category).permit(:name)
    end
end
