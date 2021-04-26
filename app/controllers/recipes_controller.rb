class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show, :index]
  


  def recipe_owner
    unless @job.user_id == current_user.id || current_user.admin?
     flash[:notice] = 'Access denied as you are not owner of this Recipe'
     redirect_to recipes_path
    end
   end



  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all.order(name: :asc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_ingredient_group = RecipeIngredientGroup.new
    @recipe_ingredients = @recipe.recipe_ingredients
    @recipe_ingredient_groups = @recipe.recipe_ingredient_groups
    
    @recipe_ingredient = RecipeIngredient.new
    @ingredient = Ingredient.new
    
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create

    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    

    respond_to do |format|
      if @recipe.save
        recipe_ingredient_group = @recipe.recipe_ingredient_groups.new
        recipe_ingredient_group.name = "Main ingredients"
        recipe_ingredient_group.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :meal_type, :method, :content, :view_link, :main_image, :portions, :user, :public, :buy_link)
    end
end
