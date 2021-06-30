class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]



  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.order(ingredient_category_id: :asc, name: :asc)
    @bakery_ingredients = @ingredients.where(ingredient_category_id: 3)
    # @bakery_ingredient = Ingredient.new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
    if params[:inline]
      render(@ingredient)
    end
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    # @ingredient.build_ingredient_category
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = current_user

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path, notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: ingredients_path }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@ingredient, partial: "ingredients/form", locals: { ingredient: @ingredient })}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredients_path, notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: ingredients_patht }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: ingredients_patht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy

    respond_to do |format|
      # format.turbo_stream
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:user, :name, :ingredient_category_id, :main_image, ingredient_category_attributes: [:name, :id])
    end
end
