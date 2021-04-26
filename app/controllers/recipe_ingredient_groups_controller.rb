class RecipeIngredientGroupsController < ApplicationController
  before_action :set_recipe_ingredient_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /recipe_ingredient_groups or /recipe_ingredient_groups.json
  def index
    @recipe_ingredient_groups = RecipeIngredientGroup.all
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /recipe_ingredient_groups/1 or /recipe_ingredient_groups/1.json
  def show
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /recipe_ingredient_groups/new
  def new
    @recipe_ingredient_group = RecipeIngredientGroup.new
  end

  # GET /recipe_ingredient_groups/1/edit
  def edit
    @recipe_ingredient_group = RecipeIngredientGroup.find(params[:id])
    @recipe = @recipe_ingredient_group.recipe
  end

  # POST /recipe_ingredient_groups or /recipe_ingredient_groups.json
  def create
    @recipe = Recipe.find(params[:recipe_id])

    @recipe_ingredient_group = @recipe.recipe_ingredient_groups.new(recipe_ingredient_group_params)

    respond_to do |format|
      if @recipe_ingredient_group.save
        format.html { redirect_to @recipe, notice: "Recipe ingredient group was successfully created." }
        format.json { render :show, status: :created, location: @recipe_ingredient_group }
      else
        format.html { redirect_to @recipe, notice: "Group not added - ingredient group name missing!" }
        format.json { render :show, status: :created, location: @recipe_ingredient_group }
      end
    end
  end

  # PATCH/PUT /recipe_ingredient_groups/1 or /recipe_ingredient_groups/1.json
  def update
    @recipe = @recipe_ingredient_group.recipe
    respond_to do |format|
      if @recipe_ingredient_group.update(recipe_ingredient_group_params)
        format.html { redirect_to @recipe, notice: "Recipe ingredient group was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredient_groups/1 or /recipe_ingredient_groups/1.json
  def destroy
    @recipe_ingredient_group.destroy
    @recipe = @recipe_ingredient_group.recipe
    respond_to do |format|
      format.html { redirect_to @recipe, notice: "Recipe ingredient group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient_group
      @recipe_ingredient_group = RecipeIngredientGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_ingredient_group_params
      params.require(:recipe_ingredient_group).permit(:name, :recipe_id)
    end
end
