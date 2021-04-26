class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]

  # require 'openfoodfacts'
  # require 'fatsecret'
  # FatSecret.init(:fat_secret, :key => '4dc13d0bb3c7490999fad64eb2d50224', :secret => '777e3432e45c4361b4ec812e235d5474')


  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.order(ingredient_category_id: :asc, name: :asc)
    @new_ingredient = Ingredient.new
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    @ingredient.build_ingredient_category

    # @products = Openfoodfacts::Product.search("chicken breast", locale: 'uk')

    # FoodInfo.establish_connection(:fat_secret, :key => '4dc13d0bb3c7490999fad64eb2d50224', :secret => '777e3432e45c4361b4ec812e235d5474')

    # @fatsecret = FatSecret.search_food('milk')

    # FatSecret.configure do |config|
    #   config.access_key = 4dc13d0bb3c7490999fad64eb2d50224
    #   config.consumer_key = 4dc13d0bb3c7490999fad64eb2d50224
    #   config.shared_secret = 0c37b8cf2f654a08977f9dc308d70ab9
    #   # config.logger = <your logger> #OPTIONAL
    # end

    # @fatsecret = FatSecret::Food.search('Milk')
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
