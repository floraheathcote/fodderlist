//this works:
@mi = Ingredient.
joins(<<-SQL).
  LEFT JOIN ingredient_categories on ingredients.ingredient_category_id=ingredient_categories.id
  LEFT JOIN meal_ingredients on meal_ingredients.ingredient_id=ingredients.id
  LEFT JOIN meals on meals.id=meal_ingredients.meal_id
  LEFT JOIN days on days.id=meals.day_id
  LEFT JOIN meal_plans on meal_plans.id=days.meal_plan_id
SQL
where("meal_plans.id = 67")
.pluck("ingredient_categories.name, ingredients.name, meal_ingredients.quantity, meal_ingredients.unit")
.group_sum




@mi = MealIngredient.
joins(<<-SQL).
  LEFT JOIN meals on meals.id=meal_ingredients.meal_id
  LEFT JOIN days on days.id=meals.day_id
  LEFT JOIN meal_plans on meal_plans.id=days.meal_plan_id
  LEFT JOIN ingredients on meal_ingredients.ingredient_id=ingredients.id
SQL
where("meal_plans.id = 67")
  
  
  
  LEFT JOIN ingredients on meal_ingredients.ingredient_id=ingredients.id
  LEFT JOIN ingredient_categories on ingredient.ingredient_category_id = ingredient_category.id
 
 
 # MealPlan.joins(<<-SQL).  
        #       LEFT JOIN days on meal_plans.id=days.meal_plan_id 
        #       LEFT JOIN meals on days.id=meals.day_id
        #       LEFT JOIN meal_ingredients as mi on meals.id=mi.meal_id
        #       LEFT JOIN ingredients as i on mi.ingredient_id=i.id
        #       LEFT JOIN ingredient_categories as ic on i.ingredient_category_id = ic.id
        #     SQL
        #     where('meal_plans.id': 66)

    # @all_mi = 
    # MealIngredient.
    #   joins(:meal).
    #   joins(:day).
    #   joins(:meal_plan).
    #   where("meal_plan = @meal_plan")


      

      # sql = meal_ingredients.find(:all,
      #           :joins=>"   JOIN meals ON meal.id = meal_ingredients.meal_id
      #                       JOIN days ON day.id = meals.day_id
      #                       JOIN meal_plan ON meal_plans.id = meals.meal_plan_id"
      #           :conditions=>"meal_plan.id = @meal_plan.id")
      # @records_array = ActiveRecord::Base.connection.execute(sql)



      # Client.find_by_sql("
      #     SELECT * FROM clients
      #     INNER JOIN orders ON clients.id = orders.client_id
      #     ORDER BY clients.created_at desc
      #   ")

    @mi_sql = MealIngredient.find_by_sql("
        SELECT 	    meal_plans.id as "meal_plan.id", 
                    mi.ingredient_id, 
                    mi.unit, i.name as "ingredient.name", 
                    ic.name as "ingredient_category.name", 
                    SUM(mi.quantity) 
            FROM meal_plans
            INNER JOIN days on meal_plans.id=days.meal_plan_id AND meal_plans.id=66
            INNER JOIN meals on days.id=meals.day_id
            INNER JOIN meal_ingredients as mi on meals.id=mi.meal_id
            INNER JOIN ingredients as i on mi.ingredient_id=i.id
            INNER JOIN ingredient_categories as ic on i.ingredient_category_id = ic.id
            GROUP BY meal_plans.id, mi.ingredient_id, mi.unit, i.name, ic.name
            ORDER BY ic.name
        ")



    # @all_mi = MealIngredient.find_by_sql("
    #     SELECT mi.ingredient_id, mi.unit, i.name AS ing_name, ic.name AS cat_name, SUM(mi.quantity) FROM meal_plans
    #     LEFT JOIN days on meal_plans.id=days.meal_plan_id 
    #     LEFT JOIN meals on days.id=meals.day_id
    #     LEFT JOIN meal_ingredients as mi on meals.id=mi.meal_id
    #     LEFT JOIN ingredients as i on mi.ingredient_id=i.id
    #     LEFT JOIN ingredient_categories as ic on i.ingredient_category_id = ic.id
    #     GROUP BY mi.ingredient_id, mi.unit, i.name, ic.name
    #     ORDER BY ic.name")

    #     MealIngredient.joins(:meal, :day, :meal_plan)

    #     MealIngredient.joins(meal: { day: :meal_plan } )



    @mp = meal_plans.find(:all,
    :joins=>"   JOIN days on meal_plans.id=days.meal_plan_id AND meal_plans.id=66
                JOIN meals on days.id=meals.day_id
                JOIN meal_ingredients on meals.id=meal_ingredients.meal_id
                JOIN ingredients on meal_ingredients.ingredient_id=ingredients.id
                JOIN ingredient_categories on ingredients.ingredient_category_id = ingredient_categories.id"
    :conditions=>"meal_plan.id = '67'")


    @products = Product.
        .order(id: :desc)
        .joins(:store)
        .select("products.id, products.store_id, stores.name")
        .limit(1)

    @mp3 = MealPlan.
        .joins(day: [ meal: [ meal_ingredient: [ {ingredient: :ingredient_category)
        .select(    meal_plans.id,
		            meal_ingredients.ingredient_id, 
		            meal_ingredients.unit, ingredients.name, 
		            ingredient_categories.name)


    @mp3 =  MealPlan
    .joins(     days: [ meal: [ meal_ingredient: [ {ingredient: :ingredient_category} ]]])
    .select(    "meal_plans.id,
                meal_ingredients.ingredient_id, 
                meal_ingredients.unit,
                ingredients.name, 
                ingredient_categories.name")

this works:
@mp3 =  MealPlan
    .joins(     days: [ meals: :meal_ingredients])
    .select(    "meal_plans.id,
                meal_ingredients.ingredient_id, 
                SUM(meal_ingredients.quantity),
                meal_ingredients.unit")
    .group(     'meal_ingredients.ingredient_id, meal_plans.id, meal_ingredients.unit')
    .where(     "meal_plans.id = '#{@meal_plan.id}'")

    def all_meal_plan_ing_categories
        ing_category_names = []
        self.all_meal_plan_ingredients.each do |ing|
            ing_category_names << ing.cat_name
        end
        ing_category_names.uniq
    ends


    get list of all ingredient_categories
                @cats = @active_record_ingredients.map { |ing| [ing.cat_name] }.uniq >> [["fresh meat & fish"], ["fruit, veg, salad"], ["honey, jam, chocolate spread"], ["oil, vinegar, soy sauce, table sauce, mustard"]]
                count cats
    for each category index, find ingredients in meal_plan in that category
        use index of @cats array
        for @cats.count.times do [index]
            print @cats[index].name as a title
            then list relevant ingredients:
                @array_of_arrays[index].select { |x|  }


                        end
            

    arr.select { |a| a > 3 }


    restructure array to nested arrays:
                [
                    array[0][0]
    array[0]    ["fresh meat & fish", 
                                        array[0][1][0]      array[0][1][1]
                            array[0][1]  ["beef fillet", [{qty: 3, unit: ""}]], 
                            array[0][2]  ["sausages", [{qty: 2, unit: ""}]]    ]
                array[1][0]
    array[1]    ["oil, vinegar, soy sauce",
                                            array[1][1][0]          array[1][1][1]
                             array[1][1] ["apple cider vinegar", [{qty: 1, unit: "teaspoon"},{qty: 2, unit: "tablespoon"}]]            ]
                ]

def organised_ingredients_array(@array_of_arrays)
    ingredient_address = final_array[current_line][1][ingredient_index]
    category_address = final_array[current_line][0]
    final_array = []
    current_line = 0
    ingredient_index = 0
    prev_cat = ""
    prev_ing = ""
    @array_of_arrays.count.times do |index|
        if @array_of_arrays[index][1] == prev_cat 
            # stay on current line
            if @array_of_arrays[index][2] == prev_ing #need to add sum & unit to current ingredient
                # ing_address same
                # add hash of qty/unit to current ing_address
                ingredient_address << [{sum: a_of_a[index][3], unit: a_of_a[index][4]}]
            else #need to add a new ingredient, then add sum & unit to new ingredient
                # increment ing_address
                # add ingredient to ing_address
                # add hash of sum/unit to current ing_address
                ingredient_index += 1
                ingredient_address << array_of_arrays[index][2]
                prev_ing = array_of_arrays[index][2]
            end
        else  # increment current_line, add new category name, reset ingredient_address
            current_line +=1
            ingredient_index = 0
            category_address << array_of_arrays[index][1].to_a
            ingredient_address << [{sum: a_of_a[index][3], unit: a_of_a[index][4]}]
            prev_cat = array_of_arrays[index][1]
        end
        final_array
    end
end

    for each ingredient, find summed qtys and units

 

        @array_of_arrays = @array_of_hashes.map {|x| x.values} >>
        [
        [67, "fresh meat & fish", "beef fillet", 0.15e2, ""], 
        [67, "fresh meat & fish", "beef fillet", 600, "gram"], 
        [67, "fresh meat & fish", "sausages", 0.2e1, ""], 
        [67, "fresh meat & fish", "skin-on salmon fillets", 0.4e1, ""], 
        [67, "fruit, veg, salad", "avocado", "", 0.19e2], 
        [67, "fruit, veg, salad", "brocolli", "head", 0.1e1], 
        [67, "fruit, veg, salad", "cherry tomatoes", "pack", 0.4e1], 
        [67, "fruit, veg, salad", "cucumber", "", 0.2e1], 
        [67, "fruit, veg, salad", "fresh ginger", "teaspoon", 0.5e1], 
        [67, "fruit, veg, salad", "frozen peas", "cups", 0.3e1], 
        [67, "fruit, veg, salad", "lemon", "", 0.2e1], 
        [67, "honey, jam, chocolate spread", "honey", "cup", 0.6e1], 
        [67, "oil, vinegar, soy sauce, table sauce, mustard", "apple cider vinegar", "tsp", 0.2e1], 
        [67, "oil, vinegar, soy sauce, table sauce, mustard", "apple cider vinegar", "tablespoons", 0.12e2], 
        [67, "oil, vinegar, soy sauce, table sauce, mustard", "olive oil", "tablespoons", 0.8e1]]


        array_of_arrays[0] = [67, "fresh meat & fish", "beef fillet", "", 0.15e2]
        array_of_arrays[0][1] = "fresh meat & fish"
        array_of_arrays[0][2] = "beef fillet"
        array_of_arrays[0][3] = 0.15e2
        array_of_arrays[0][4] = ""


        <h2>All Ingredients: </h2>

<% check_cat_name = "" %>
<% check_ing_name = "" %>

<% @active_record_ingredients.each do |mp| %>
      <% unless check_cat_name == mp.cat_name %>
          <br><br>
          <h5><%= mp.cat_name %><br></h5>
          <% check_cat_name = mp.cat_name %>
      <% end %>
      <% unless check_ing_name == mp.ing_name -%>
        <%= mp.ing_name -%>
        <% check_ing_name = mp.ing_name -%>
      <% end -%>
      <%= pluralize(mp.sum, mp.unit) -%>
      
      <br>
<% end %>



To buy:

<ul>
<% prev_category = nil %>
<% prev_ingredient = nil %>
<% prev_item  = nil %>
<ul>
<% @shopping_list_items_unticked.each do |item| %>
    
    <% if prev_item.present? %>
        <% unless item.ingredient == prev_ingredient -%>
              <% if item.ticked %>
                <%= link_to("un-tick", shopping_list_item_toggle_tick_path(prev_item) ) %>
                </li> 
                <% else %>
                <%= link_to("edit quantity", edit_shopping_list_item_path(prev_item) ) %>
                <%= link_to("tick off", shopping_list_item_toggle_tick_path(prev_item) ) %>
              <% end %>
        <% end %>
    <% end %>

    <% unless item.ingredient.ingredient_category == prev_category -%><br><br><h6><%= item.ingredient.ingredient_category.name %></h6><% end -%>
    <% prev_category = item.ingredient.ingredient_category -%>

    <% unless item.ingredient == prev_ingredient -%><br> 
        <li><%= item.ingredient.name -%>: 
    <% end -%>
    
    <% if item.ingredient == prev_ingredient -%> & 
    <% end %>
    <%= item.sum_qty.round(0.05) %> <%= item.unit %>

    <% if item == @shopping_list_items_unticked.last %>
              <% if item.ticked %>
                <%= link_to("un-tick", shopping_list_item_toggle_tick_path(prev_item) ) %>
                </li> 
                <% else %>
                <%= link_to("edit quantity", edit_shopping_list_item_path(prev_item) ) %>
                <%= link_to("tick off", shopping_list_item_toggle_tick_path(prev_item) ) %>
              <% end %>
    <% end %>


    <% prev_ingredient = item.ingredient %>
    <% prev_item = item %>
<% end %>
</ul>




Bought / already got:
<% @shopping_list_items_ticked.each do |item| %>
    <%= item.ingredient.name %>   
<% end %>




after_initialize :create_meals_for_day

def create_meals_for_day
  ["breakfast", "lunch", "evening meal"].each do |mealtype|
      meal = Meal.new
      meal.meal_type = mealtype
      meal.name = "Add meal name"
      meal.day_id = self.id
      meal.save
  end
end

<%= month_calendar events: @days do |date, days| %>
    <%= date.day %>
  
  
    <%= link_to (bi_icon 'plus-circle', class: 'ingredient-style'), 
            new_meal_plan_path(@meal_plan, start_date: date) %>
  
  
    <% days.each do |day| %>
  
        <div class="container-fluid rounded bg-dark">
          
          <% if day.meals.present? %>
            <% if day.meals.first.meal_recipes.present? %>
                MP: <% day.meal_plan.id %> <%= day.meals.first.meal_recipes.first.recipe.name %>
            <% end %>
          <% else %>
              <% day.meal_plan.id %>
          <% end %>
  
  
                  <%#= day.meals.first.meal_recipes %>
  
        </div>
      
    <% end %>
  <% end %>



  MealRecipe.joins(   " INNER JOIN meals on meal_recipes.meal_id = meals.id
                          INNER JOIN days on meals.day_id = days.id
                          INNER JOIN recipes on meal_recipes.recipe_id = Recipe.id
                          ")
              .select(  " days.date, recipes.id")



def all_recipe_ids_for_day(date)

@shopping_list_items_ticked = ShoppingListItem.where(meal_plan: @meal_plan, ticked: true).joins(:ingredient).order(ingredient_category_id: :asc)



    all_recipe_ids = []
    formatted_date = date.strftime("%F")
    ar = User.joins(   "  INNER JOIN meal_plans on users.id=meal_plans.user_id AND users.id='#{current_user.id}'
                            INNER JOIN days on meal_plans.id=days.meal_plan_id
                            INNER JOIN meals on days.id=meals.day_id AND days.date='#{date}'
                            INNER JOIN meal_recipes on meals.id=meal_recipes.meal_id
                            INNER JOIN recipes on meal_recipes.recipe_id=recipes.id"
                            )
            .select(  "     recipes.id AS recipe_id ")
            .order( "       days.date ASC")

    ar.each do |recipe|
    all_recipe_ids << recipe.recipe_id
    end
    all_recipe_ids
end

<%= month_calendar events: @meal_plans do |date, meal_plans| %>
    <%= date.day %>
        <%#= all_recipe_ids_for_day(date) %>
    <%# if date_array.include?(date) %>
      <%#= all_recipe_ids_for_day(date) %>
    <%# end %>
  
    <%= link_to (bi_icon 'plus-circle', class: 'ingredient-style'), 
            new_meal_plan_path(@meal_plan, start_date: date) %>
  
  
    <% meal_plans.each do |meal_plan| %>
  
        <div class="container-fluid rounded bg-dark">
          <%= link_to meal_plan.name, meal_plan %>
        </div>
      
    <% end %>
  <% end %>
  










  <% all_meals(day).each do |meal| %>
    <small class="text-muted"><%= meal.name %></small><br>
      <% meal.meal_recipes.each do |mr| %>
        <%= image_tag(mr.recipe.main_image, size: '40', style: 'object-fit: cover') %>
      <% end %>
  <% end %>




  <% all_meal_recipes(day).each do |mr| %>
      
    <% if mr.meal == prev_meal -%>
    <% else %>
      <small class="text-muted"><%= mr.meal.name -%></small><br>
    <% end %>
    <% prev_meal = mr.meal %>

    <%= image_tag(mr.recipe.main_image, size: '40', style: 'object-fit: cover') -%>
  
<% end %>



<% if day.meal_plan == prev_mp %>
<% if day.meal_plan.status == "draft"%>
    <%= link_to "------", day.meal_plan, class: 'btn btn-secondary btn-block' %>
<% else %>
    <%= link_to "------", day.meal_plan, class: 'btn btn-success btn-block' %>
<% end %>
<% else %>
<div class="row justify-content-center float-right">
<% if day.meal_plan.status == "draft"%>
    <%= link_to day.meal_plan.status, day.meal_plan, class: 'btn btn-secondary' %>
<% else %>
    <%= link_to day.meal_plan.status, day.meal_plan, class: 'btn btn-success btn' %>
<% end %>
</div>
<% end %>






<% if day.meal_plan == prev_mp %>
<% if day.meal_plan.status == "draft"%>
    <%= link_to "------", day.meal_plan, class: 'btn btn-secondary btn-block' %>
<% else %>
    <%= link_to "------", day.meal_plan, class: 'btn btn-success btn-block' %>
<% end %>
<% else %>
<div class="row justify-content-center float-right">
<% if day.meal_plan.status == "draft"%>
    <%= link_to day.meal_plan.status, day.meal_plan, class: 'btn btn-secondary' %>
<% else %>
    <%= link_to day.meal_plan.status, day.meal_plan, class: 'btn btn-success btn' %>
<% end %>
</div>
<% end %>




User.create! :name => 'Flora Heathcote', :email => 'flora.heathcote@gmail.com', :password => 'monday', :password_confirmation => 'monday'


<% if meal.meal_recipes.present? %>
<% meal.meal_image_array.each do |image| %>
    <div class="col-sm">
    <%= image_tag(image, class: "rounded-circle", size: '50', style: 'object-fit: cover')  %>
    </div>
<% end%>     

<% else %>
<div class="col-sm">
<%= link_to image_tag( 'https://reciping.s3.us-east-2.amazonaws.com/plate.jpg', class: "rounded-circle", size: '200', style: 'object-fit: cover' ) %>
</div>
<% end %>