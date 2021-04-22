module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
  
  def avatar_path(object, options = {})
    size = options[:size] || 180
    default_image = options[:default] || "mp"
    base_url =  "https://secure.gravatar.com/avatar"
    base_url_params = "?s=#{size}&d=#{default_image}"
    
    if object.respond_to?(:avatar) && object.avatar.attached? && object.avatar.variable?
      object.avatar.variant(resize_to_fill: [size, size, { gravity: 'Center' }])
    elsif object.respond_to?(:email) && object.email
      gravatar_id = Digest::MD5::hexdigest(object.email.downcase)
      "#{base_url}/#{gravatar_id}#{base_url_params}"
    else
      "#{base_url}/00000000000000000000000000000000#{base_url_params}"
    end
  end

  def main_image(model)
    if model.main_image.attached?
        image_tag model.main_image.variant(resize_to_limit: [150, nil])
    else
        image_tag "placeholder.jpg"
    end
  end   

  def round_nicely(number)
    if number.round(1) == number.to_i
      number.to_i
    else
      number.round(1)
    end
  end

  def nice_date(date)
    "#{date.strftime("%A %b")} #{date.day.ordinalize}"
    "#{date.strftime("%A")} #{date.day.ordinalize} #{date.strftime("%b")}"


    # date.strftime("%A %-d %b")
  end

  

  # def bi_icon(icon, options = {})
  #   klasses = ["bi"].append(options.delete(:class)).compact
  #   content_tag :svg, options.merge(class: klasses, fill: "currentColor") do
  #     content_tag :use, nil, "xlink:href" => "#{ asset_path 'bootstrap-icons/bootstrap-icons.svg' }##{icon}"
  #   end
  # end


  # def user_meal_plan_date_ar
  #   User
  #   .joins(   " INNER JOIN meal_plans on users.id=meal_plans.user_id AND users.id='#{current_user.id}'
  #               INNER JOIN days on meal_plans.id=days.meal_plan_id
  #               INNER JOIN meals on days.id=meals.day_id
  #               INNER JOIN meal_recipes on meals.id=meal_recipes.meal_id
  #               INNER JOIN recipes on meal_recipes.recipe_id=recipes.id"
  #               )
  #   .select(  " days.date,
  #               recipes.id AS recipe_id ")
  #   .order( "   days.date ASC")
  # end


  # def date_array
  #     all_dates = []
  #     user_meal_plan_date_ar.each do |date|
  #       all_dates << date.date
  #     end
  #     all_dates
  # end

  

  def all_meal_recipes(day)
    # MealRecipe.joins(:meal).where(day: day)
    MealRecipe.joins( "       INNER JOIN meals on meals.id=meal_recipes.meal_id
                              INNER JOIN days on days.id=meals.day_id
                              INNER JOIN meal_plans on meal_plans.id=days.meal_plan_id AND days.id='#{day.id}'
                              INNER JOIN users on users.id=meal_plans.user_id AND users.id='#{current_user.id}'
                              INNER JOIN recipes on recipes.id=meal_recipes.recipe_id"
                              )
              .select(  "     recipes.id AS recipe_id, meals.id AS meal_id ")
              .order( "       days.date ASC")
  end

  def all_leftovers_in_day(day)
    MealWithLeftover.joins( " INNER JOIN meals on meal_with_leftovers.meal_id=meals.id
                              INNER JOIN days on days.id=meals.day_id
                              INNER JOIN meal_plans on meal_plans.id=days.meal_plan_id AND days.id='#{day.id}'
                              INNER JOIN users on users.id=meal_plans.user_id AND users.id='#{current_user.id}'
                              INNER JOIN leftovers on meal_with_leftovers.leftover_id=leftovers.id
                              INNER JOIN meal_recipes on leftovers.meal_recipe_id=meal_recipes.id

                              INNER JOIN recipes on recipes.id=meal_recipes.recipe_id"
                              )
              .select(  "     recipes.id AS recipe_id, meals.id AS meal_id, leftovers.id AS leftover_id ")
              .order( "       days.date ASC")
  end



  # def current_day_current_user
  #   Day.joins("         INNER JOIN meal_plans on days.meal_plan_id = meal_plans.id 
  #                             INNER JOIN users on meal_plans.user_id = users.id AND users.id='#{current_user.id}'")
  #       .select("             days.id AS day_id, days.date")
  #       .where("              days.date='#{DateTime.current.to_date}'")



    # day = Day.joins(meal_plan: [:user]).where(["user = :user and day.date = :date", { user: current_user, date: DateTime.now}])
    
  # end

end


