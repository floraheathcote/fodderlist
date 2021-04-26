User.create!([
  {email: "flora.heathcote@gmail.com", password: "monday", password_confirmation: "monday", first_name: "Flora", last_name: "Heathcote", admin: true}
])

IngredientCategory.create!([
  {name: "bakery"},
  {name: "fruit, veg, salad"},
  {name: "frozen foods"},
  {name: "fresh meat & fish"},
  {name: "dairy & eggs"},
  {name: "deli & convenience"},
  {name: "food cupboard"},
  {name: "beer, wine, spirits"},
  {name: "soft drinks & juices"},
  {name: "world food"}
])

user = User.first
ic = IngredientCategory.find_by(name: "bakery")
  ic.ingredients.create!( name:  "rye bread", user_id: user.id )
  ic.ingredients.create!( name:  "sourdough - white", user_id: user.id )

ic = IngredientCategory.find_by(name: "dairy & eggs")
  ic.ingredients.create!( name:  "feta cheese", user_id: user.id )
  ic.ingredients.create!( name:  "buratum", user_id: user.id )
  ic.ingredients.create!( name:  "bufallo mozzarrela", user_id: user.id )
  ic.ingredients.create!( name:  "butter - salted", user_id: user.id )
  ic.ingredients.create!( name:  "butter", user_id: user.id )
  ic.ingredients.create!( name:  "creme fraiche", user_id: user.id )
  ic.ingredients.create!( name:  "kefir", user_id: user.id )
  ic.ingredients.create!( name:  "greek yogurt", user_id: user.id )
  ic.ingredients.create!( name:  "egg", user_id: user.id )
  ic.ingredients.create!( name:  "butter - unsalted", user_id: user.id )
  ic.ingredients.create!( name:  "milk", user_id: user.id )
  ic.ingredients.create!( name:  "plain yogurt", user_id: user.id )
  ic.ingredients.create!( name:  "cheddar cheese", user_id: user.id )
  ic.ingredients.create!( name:  "cheese curd (live cultures)", user_id: user.id )
  ic.ingredients.create!( name:  "double cream", user_id: user.id )
  ic.ingredients.create!( name:  "cottage cheese (live cultures)", user_id: user.id )

ic = IngredientCategory.find_by(name: "fresh meat & fish")
  ic.ingredients.create!( name:  "beef fillet steak", user_id: user.id )
  ic.ingredients.create!( name:  "skin-on chicken thigh", user_id: user.id )
  ic.ingredients.create!( name:  "pistachio", user_id: user.id )
  ic.ingredients.create!( name:  "brazil nut", user_id: user.id )
  ic.ingredients.create!( name:  "dried goji berry", user_id: user.id )
  ic.ingredients.create!( name:  "beef short rib", user_id: user.id )
  ic.ingredients.create!( name:  "macadamia nut", user_id: user.id )
  ic.ingredients.create!( name:  "sirloin steak", user_id: user.id )
  ic.ingredients.create!( name:  "caper", user_id: user.id )
  ic.ingredients.create!( name:  "kalamata olife", user_id: user.id )
  ic.ingredients.create!( name:  "flax seed", user_id: user.id )
  ic.ingredients.create!( name:  "soy sauce (fermented)", user_id: user.id )
  ic.ingredients.create!( name:  "balsamic vinegar", user_id: user.id )
  ic.ingredients.create!( name:  "turkey thigh", user_id: user.id )
  ic.ingredients.create!( name:  "lamb rib", user_id: user.id )
  ic.ingredients.create!( name:  "bone-in canned salmon", user_id: user.id )
  ic.ingredients.create!( name:  "anchovy", user_id: user.id )
  ic.ingredients.create!( name:  "canned mackerel", user_id: user.id )
  ic.ingredients.create!( name:  "avocado oil", user_id: user.id )
  ic.ingredients.create!( name:  "sardines (in olive oil)", user_id: user.id )
  ic.ingredients.create!( name:  "apple cider vinegar", user_id: user.id )
  ic.ingredients.create!( name:  "worcestershire sauce", user_id: user.id )
  ic.ingredients.create!( name:  "tobasco / hot chilli sauce", user_id: user.id )
  ic.ingredients.create!( name:  "low sugar ketchup", user_id: user.id )
  ic.ingredients.create!( name:  "mustard - english", user_id: user.id )
  ic.ingredients.create!( name:  "mustard powder", user_id: user.id )
  ic.ingredients.create!( name:  "wholegrain mustard", user_id: user.id )
  ic.ingredients.create!( name:  "dijon mustard", user_id: user.id )
  ic.ingredients.create!( name:  "mayonnaise (avocado oil)", user_id: user.id )
  ic.ingredients.create!( name:  "cracker", user_id: user.id )
  ic.ingredients.create!( name:  "thai curry paste", user_id: user.id )
  ic.ingredients.create!( name:  "maple syrup", user_id: user.id )
  ic.ingredients.create!( name:  "jalepenos (pickled)", user_id: user.id )
  ic.ingredients.create!( name:  "buckwheat kernels (dried)", user_id: user.id )
  ic.ingredients.create!( name:  "sea salt (unrefined)", user_id: user.id )
  ic.ingredients.create!( name:  "sun-dried tomatoes (jar)", user_id: user.id )
  ic.ingredients.create!( name:  "red wine", user_id: user.id )
  ic.ingredients.create!( name:  "black pepper", user_id: user.id )
  ic.ingredients.create!( name:  "bacon - smoked streaky", user_id: user.id )
  ic.ingredients.create!( name:  "bacon - unsmoked streaky", user_id: user.id )
  ic.ingredients.create!( name:  "bacon", user_id: user.id )
  ic.ingredients.create!( name:  "tomato puree", user_id: user.id )
  ic.ingredients.create!( name:  "pure water", user_id: user.id )
  ic.ingredients.create!( name:  "plain flour", user_id: user.id )
  ic.ingredients.create!( name:  "asian chilli powder", user_id: user.id )
  ic.ingredients.create!( name:  "nutmeg", user_id: user.id )
  ic.ingredients.create!( name:  "allspice", user_id: user.id )
  ic.ingredients.create!( name:  "brandy", user_id: user.id )
  ic.ingredients.create!( name:  "mace", user_id: user.id )
  ic.ingredients.create!( name:  "cinnamon", user_id: user.id )
  ic.ingredients.create!( name:  "paprika", user_id: user.id )
  ic.ingredients.create!( name:  "garlic granule", user_id: user.id )
  ic.ingredients.create!( name:  "lamb chop", user_id: user.id )
  ic.ingredients.create!( name:  "skin-on salmon fillet", user_id: user.id )
  ic.ingredients.create!( name:  "flakey sea salt", user_id: user.id )
  ic.ingredients.create!( name:  "kimchee", user_id: user.id )
  ic.ingredients.create!( name:  "chicken carcass", user_id: user.id )
  ic.ingredients.create!( name:  "cumin seed", user_id: user.id )
  ic.ingredients.create!( name:  "coriander seed", user_id: user.id )
  ic.ingredients.create!( name:  "chilli flake", user_id: user.id )
  ic.ingredients.create!( name:  "pomegranate molass", user_id: user.id )
  ic.ingredients.create!( name:  "smoked salmon", user_id: user.id )
  ic.ingredients.create!( name:  "sauerkraut", user_id: user.id )
  ic.ingredients.create!( name:  "honey", user_id: user.id )
  ic.ingredients.create!( name:  "white basmati rice", user_id: user.id )
  ic.ingredients.create!( name:  "sausage", user_id: user.id )
  ic.ingredients.create!( name:  "chicken breast", user_id: user.id )
  ic.ingredients.create!( name:  "frozen peas", user_id: user.id )
  ic.ingredients.create!( name:  "fresh trout", user_id: user.id )
  ic.ingredients.create!( name:  "chicken liver", user_id: user.id )
  ic.ingredients.create!( name:  "lamb mince", user_id: user.id )
  ic.ingredients.create!( name:  "fresh mackerel", user_id: user.id )
  ic.ingredients.create!( name:  "wild alaskan smoked salmon", user_id: user.id )
  ic.ingredients.create!( name:  "sesame seed", user_id: user.id )
  ic.ingredients.create!( name:  "sesame oil", user_id: user.id )
  ic.ingredients.create!( name:  "pork shoulder", user_id: user.id )
  ic.ingredients.create!( name:  "tomatoes - tinned", user_id: user.id )
  ic.ingredients.create!( name:  "beef stock", user_id: user.id )
  ic.ingredients.create!( name:  "chicken stock", user_id: user.id )
  ic.ingredients.create!( name:  "coconut oil", user_id: user.id )
  ic.ingredients.create!( name:  "lamb shoulder", user_id: user.id )
  ic.ingredients.create!( name:  "pork sausage", user_id: user.id )
  ic.ingredients.create!( name:  "lamb shank", user_id: user.id )
  ic.ingredients.create!( name:  "wild rice", user_id: user.id )
  ic.ingredients.create!( name:  "pork spare rib", user_id: user.id )
  ic.ingredients.create!( name:  "beef burger", user_id: user.id )
  ic.ingredients.create!( name:  "almond", user_id: user.id )
  ic.ingredients.create!( name:  "walnut", user_id: user.id )
  ic.ingredients.create!( name:  "cornflour", user_id: user.id )
  ic.ingredients.create!( name:  "red kidney beans (tinned)", user_id: user.id )
  ic.ingredients.create!( name:  "seed", user_id: user.id )
  ic.ingredients.create!( name:  "beef mince", user_id: user.id )
  ic.ingredients.create!( name:  "olive oil", user_id: user.id )
  ic.ingredients.create!( name:  "chickpea", user_id: user.id )
  ic.ingredients.create!( name:  "turkey mince", user_id: user.id )
  ic.ingredients.create!( name:  "ribeye beef steak", user_id: user.id )
  ic.ingredients.create!( name:  "wild alaskan salmon fillet", user_id: user.id )
  ic.ingredients.create!( name:  "coconut milk", user_id: user.id )
  ic.ingredients.create!( name:  "rice noodle", user_id: user.id )
  ic.ingredients.create!( name:  "fresh tortellini", user_id: user.id )
  ic.ingredients.create!( name:  "cashew", user_id: user.id )
  ic.ingredients.create!( name:  "pecan nut", user_id: user.id )
  ic.ingredients.create!( name:  "whole oat", user_id: user.id )
  ic.ingredients.create!( name:  "smoked mackerel", user_id: user.id )
  ic.ingredients.create!( name:  "dried chilli", user_id: user.id )
  ic.ingredients.create!( name:  "corn tortilla", user_id: user.id )
  ic.ingredients.create!( name:  "wheat wrap", user_id: user.id )
  ic.ingredients.create!( name:  "prawn", user_id: user.id )
  ic.ingredients.create!( name:  "pork shoulder, bone-in, skin-on", user_id: user.id )

ic = IngredientCategory.find_by(name: "fruit, veg, salad")
  ic.ingredients.create!( name:  "aubergine", user_id: user.id )
  ic.ingredients.create!( name:  "sprouted seed", user_id: user.id )
  ic.ingredients.create!( name:  "fresh basil", user_id: user.id )
  ic.ingredients.create!( name:  "green pepper", user_id: user.id )
  ic.ingredients.create!( name:  "onion", user_id: user.id )
  ic.ingredients.create!( name:  "tomato", user_id: user.id )
  ic.ingredients.create!( name:  "beef tomato", user_id: user.id )
  ic.ingredients.create!( name:  "garlic", user_id: user.id )
  ic.ingredients.create!( name:  "fresh rosemary", user_id: user.id )
  ic.ingredients.create!( name:  "fresh thyme", user_id: user.id )
  ic.ingredients.create!( name:  "bay leaf", user_id: user.id )
  ic.ingredients.create!( name:  "fresh ginger", user_id: user.id )
  ic.ingredients.create!( name:  "shallot", user_id: user.id )
  ic.ingredients.create!( name:  "new potato", user_id: user.id )
  ic.ingredients.create!( name:  "pomegranate", user_id: user.id )
  ic.ingredients.create!( name:  "rocket leafe", user_id: user.id )
  ic.ingredients.create!( name:  "whole fresh artichoke", user_id: user.id )
  ic.ingredients.create!( name:  "brocolli", user_id: user.id )
  ic.ingredients.create!( name:  "vegetable stock", user_id: user.id )
  ic.ingredients.create!( name:  "red onion", user_id: user.id )
  ic.ingredients.create!( name:  "chinese cabbage", user_id: user.id )
  ic.ingredients.create!( name:  "red pepper", user_id: user.id )
  ic.ingredients.create!( name:  "turmeric (fresh)", user_id: user.id )
  ic.ingredients.create!( name:  "horseradish (fresh)", user_id: user.id )
  ic.ingredients.create!( name:  "fennel bulb", user_id: user.id )
  ic.ingredients.create!( name:  "blood orange", user_id: user.id )
  ic.ingredients.create!( name:  "fresh dill", user_id: user.id )
  ic.ingredients.create!( name:  "samphire", user_id: user.id )
  ic.ingredients.create!( name:  "watercress", user_id: user.id )
  ic.ingredients.create!( name:  "red chilli", user_id: user.id )
  ic.ingredients.create!( name:  "apple", user_id: user.id )
  ic.ingredients.create!( name:  "lime", user_id: user.id )
  ic.ingredients.create!( name:  "fresh coriander / cilantro", user_id: user.id )
  ic.ingredients.create!( name:  "avocado", user_id: user.id )
  ic.ingredients.create!( name:  "cucumber", user_id: user.id )
  ic.ingredients.create!( name:  "cherry tomato", user_id: user.id )
  ic.ingredients.create!( name:  "lemon", user_id: user.id )
  ic.ingredients.create!( name:  "potato", user_id: user.id )
  ic.ingredients.create!( name:  "spring onion", user_id: user.id )
  ic.ingredients.create!( name:  "courgette", user_id: user.id )
  ic.ingredients.create!( name:  "sweet potato", user_id: user.id )
  ic.ingredients.create!( name:  "white cabbage", user_id: user.id )
  ic.ingredients.create!( name:  "red cabbage", user_id: user.id )
  ic.ingredients.create!( name:  "fresh beetroot", user_id: user.id )
  ic.ingredients.create!( name:  "blueberries - pack", user_id: user.id )
  ic.ingredients.create!( name:  "carrot", user_id: user.id )
  ic.ingredients.create!( name:  "spring greens.", user_id: user.id )
  ic.ingredients.create!( name:  "cavolo nero", user_id: user.id )
  ic.ingredients.create!( name:  "spinach", user_id: user.id )
  ic.ingredients.create!( name:  "parsnip", user_id: user.id )
  ic.ingredients.create!( name:  "coriander/cilantro", user_id: user.id )
  ic.ingredients.create!( name:  "butternut squash", user_id: user.id )
  ic.ingredients.create!( name:  "green bean", user_id: user.id )
  ic.ingredients.create!( name:  "mushroom", user_id: user.id )
  ic.ingredients.create!( name:  "ginger", user_id: user.id )
  ic.ingredients.create!( name:  "orange", user_id: user.id )
  ic.ingredients.create!( name:  "melon", user_id: user.id )
  ic.ingredients.create!( name:  "mixed salad leafe", user_id: user.id )
  ic.ingredients.create!( name:  "celery", user_id: user.id )
  ic.ingredients.create!( name:  "bok choy", user_id: user.id )




Recipe.create!([
  {name: "15 minute sesame seared salmon", meal_type: "Main meal", portions: "2.0", view_link: "http://kiwiandbean.com/15-minute-sesame-seared-salmon/", user_id: user.id, public: nil, buy_link: nil},
  {name: "Avocado & tomato salad", meal_type: "Side salad", portions: "2.0", view_link: "", user_id: user.id, public: nil, buy_link: nil},
  {name: "Becs' simple slow cooker beef short ribs", meal_type: "Main meal", portions: "4.0", view_link: "", user_id: user.id, public: nil, buy_link: nil},
  {name: "Braised short ribs with sun-dried tomatoes & herbs", meal_type: "Main meal", portions: "2.0", view_link: "https://freshrootsfarmmb.com/braised-short-ribs-with-sun-dried-tomatoes-herbs/", user_id: user.id, public: nil, buy_link: nil},
  {name: "Chicken liver pate with orange zest", meal_type: "Side dish", portions: "4.0", view_link: "https://www.deliciousmagazine.co.uk/recipes/chicken-liver-and-orange-pate/", user_id: user.id, public: nil, buy_link: nil},
  {name: "Chicken stock", meal_type: "Side dish", portions: "4.0", view_link: "", user_id: user.id, public: nil, buy_link: nil},
  {name: "Classic french chicken liver pate recipe", meal_type: "Side dish", portions: "4.0", view_link: "https://www.houseandgarden.co.uk/recipe/chicken-liver-pate", user_id: user.id, public: nil, buy_link: nil},
  {name: "Cumin-coriander roast carrots with pomegranates & avocado", meal_type: "Side dish", portions: "6.0", view_link: "https://www.splendidtable.org/story/2019/03/11/cumin-coriander-roast-carrots-with-pomegranates-avocado", user_id: user.id, public: true, buy_link: "https://read.amazon.co.uk/kp/embed?asin=B01ELUSWJU&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_BA8F80346NDX8783W4RA"},
  {name: "James martin's chicken liver pâté", meal_type: "Side dish", portions: "4.0", view_link: "https://www.bbcgoodfood.com/recipes/chicken-liver-pate", user_id: user.id, public: nil, buy_link: nil},
  {name: "Jamie's 6-hour slow-roasted pork shoulder", meal_type: "Main meal", portions: "4.0", view_link: "https://www.jamieoliver.com/recipes/pork-recipes/6-hour-slow-roasted-pork-shoulder/", user_id: user.id, public: nil, buy_link: nil},
  {name: "Kimchee with chinese cabbage", meal_type: "Side dish", portions: "20.0", view_link: "Recipe credit: Amy Levin", user_id: user.id, public: nil, buy_link: nil},
  {name: "Lamb chops and veg", meal_type: "Main meal", portions: "1.0", view_link: "", user_id: user.id, public: nil, buy_link: nil},
  {name: "Roasted salmon with jalapeño, honey and lime", meal_type: "Main meal", portions: "4.0", view_link: "https://cooking.nytimes.com/recipes/1020713-roasted-salmon-with-jalapeno-honey-and-lime", user_id: user.id, public: nil, buy_link: nil},
  {name: "Scrambled eggs", meal_type: "Main meal", portions: "1.0", view_link: "", user_id: user.id, public: nil, buy_link: nil},
  {name: "Slow cooker lamb shanks", meal_type: "Main meal", portions: "4.0", view_link: "https://www.bbc.co.uk/food/recipes/slow_cooker_braised_lamb_01950", user_id: user.id, public: nil, buy_link: nil},
  {name: "Slow-roasted salmon with fennel, citrus and chillies", meal_type: "Main meal", portions: "6.0", view_link: "https://www.bonappetit.com/recipe/slow-roasted-salmon-with-fennel-citrus-and-chiles", user_id: user.id, public: nil, buy_link: nil},
  {name: "Smoked mackerel and avo pate", meal_type: "Main meal", portions: "4.0", view_link: "", user_id: user.id, public: nil, buy_link: nil},
  {name: "Smoked mackerel pate", meal_type: "Side dish", portions: "2.0", view_link: "https://www.bbc.co.uk/food/recipes/smoked_mackerel_pt_with_36210", user_id: user.id, public: nil, buy_link: nil},
  {name: "Turmeric sauerkraut", meal_type: "Side dish", portions: "4.0", view_link: "https://www.feastingathome.com/turmeric-sauerkraut/", user_id: user.id, public: nil, buy_link: nil}
])


recipe = Recipe.find_by(name: "Roasted salmon with jalapeño, honey and lime")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients15")

recipe = Recipe.find_by(name: "15 minute sesame seared salmon")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients39")

recipe = Recipe.find_by(name: "Avocado & tomato salad")
  recipe.recipe_ingredient_groups.create!(name: "Veg")
  recipe.recipe_ingredient_groups.create!(name: "Dressing")
  recipe.recipe_ingredient_groups.create!(name: "other")

recipe = Recipe.find_by(name: "Becs' simple slow cooker beef short ribs")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients34")

recipe = Recipe.find_by(name: "Chicken liver pate with orange zest")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients32")

recipe = Recipe.find_by(name: "Chicken stock")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients42")

recipe = Recipe.find_by(name: "Classic french chicken liver pate recipe")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients41")

recipe = Recipe.find_by(name: "Cumin-coriander roast carrots with pomegranates & avocado")
  recipe.recipe_ingredient_groups.create!(name: "For the salad")
  recipe.recipe_ingredient_groups.create!(name: "for the dressing")

recipe = Recipe.find_by(name: "James martin's chicken liver pâté")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients30")
  recipe.recipe_ingredient_groups.create!(name: "For butter finish")

recipe = Recipe.find_by(name: "Jamie's 6-hour slow-roasted pork shoulder")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients28")

recipe = Recipe.find_by(name: "Kimchee with chinese cabbage")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients29")
  
recipe = Recipe.find_by(name: "Lamb chops and veg")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients22") 

recipe = Recipe.find_by(name: "Roasted salmon with jalapeño, honey and lime")
  recipe.recipe_ingredient_groups.create!(name: "to serve")

recipe = Recipe.find_by(name: "Scrambled eggs")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients40")

recipe = Recipe.find_by(name: "Slow cooker lamb shanks")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients27")
  
recipe = Recipe.find_by(name: "Slow-roasted salmon with fennel, citrus and chillies")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients38")

recipe = Recipe.find_by(name: "Smoked mackerel and avo pate")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients35")

recipe = Recipe.find_by(name: "Smoked mackerel pate")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients36")
  recipe.recipe_ingredient_groups.create!(name: "to serve")

recipe = Recipe.find_by(name: "Turmeric sauerkraut")
  recipe.recipe_ingredient_groups.create!(name: "Main ingredients33")



ingredient = Ingredient.find_by(name: "allspice")	 
recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients30")		
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "0.5",  unit: "tsp",  preparation: "ground" }])

ingredient = Ingredient.find_by(name: "apple cider vinegar")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients15")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "tbsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "asian chilli powder")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients29")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "tbsp",  preparation: "optional" }])

ingredient = Ingredient.find_by(name: "avocado")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Veg")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "avocado")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients35")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "",  preparation: "chopped" }])

ingredient = Ingredient.find_by(name: "avocado")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "For the salad")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "3.0",  unit: "",  preparation: "ripe" }])

ingredient = Ingredient.find_by(name: "bacon")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "50.0",  unit: "g",  preparation: "finely chopped" }])

ingredient = Ingredient.find_by(name: "bay leaf")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients27")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "3.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "bay leaf")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "bay leaf")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients28")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "6.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "beef short rib")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.5",  unit: "kg",  preparation: "bone-in" }])

ingredient = Ingredient.find_by(name: "beef short rib")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients34")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "kg",  preparation: "" }])

ingredient = Ingredient.find_by(name: "beef stock")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "cup",  preparation: "" }])

ingredient = Ingredient.find_by(name: "black pepper")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "0.25",  unit: "tsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "black pepper")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients36")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "pinch",  preparation: "fresh ground" }])

ingredient = Ingredient.find_by(name: "black pepper")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients34")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "generous sprinkling",  preparation: "" }])

ingredient = Ingredient.find_by(name: "blood orange")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients38")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "brandy")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients30")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "50.0",  unit: "ml",  preparation: "" }])

ingredient = Ingredient.find_by(name: "brandy")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients32")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "tbsp",  preparation: "(optional)" }])

ingredient = Ingredient.find_by(name: "brandy")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients41")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "tbsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "butter - unsalted")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "tb",  preparation: "" }])

ingredient = Ingredient.find_by(name: "butter - unsalted")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients30")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "120.0",  unit: "g",  preparation: "cubed" }])

ingredient = Ingredient.find_by(name: "butter - unsalted")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "For butter finish")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "80.0",  unit: "g",  preparation: "" }])

ingredient = Ingredient.find_by(name: "butter - unsalted")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients36")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "100.0",  unit: "g",  preparation: "chopped" }])

ingredient = Ingredient.find_by(name: "butter")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients32")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "100.0",  unit: "g",  preparation: "" }])

ingredient = Ingredient.find_by(name: "butter")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients41")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "350.0",  unit: "g",  preparation: "diced" }])

ingredient = Ingredient.find_by(name: "carrot")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients28")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "carrot")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "",  preparation: "peeled & diced" }])

ingredient = Ingredient.find_by(name: "carrot")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "For the salad")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "20.0",  unit: "",  preparation: "young carrots" }])

ingredient = Ingredient.find_by(name: "celery")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients28")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "stick",  preparation: "" }])

ingredient = Ingredient.find_by(name: "celery")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients26")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "3.0",  unit: "stick",  preparation: "" }])

ingredient = Ingredient.find_by(name: "cherry tomato")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Veg")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "0.5",  unit: "pack",  preparation: "" }])

ingredient = Ingredient.find_by(name: "chicken carcass")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients42")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "chicken liver")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients30")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "400.0",  unit: "g",  preparation: "trimmed of any membrane and gristle" }])

ingredient = Ingredient.find_by(name: "chicken liver")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients32")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "250.0",  unit: "g",  preparation: "" }])

ingredient = Ingredient.find_by(name: "chicken liver")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients41")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "400.0",  unit: "g",  preparation: "trimmed" }])

ingredient = Ingredient.find_by(name: "chicken stock")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients27")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "300.0",  unit: "ml",  preparation: "" }])

ingredient = Ingredient.find_by(name: "chilli flake")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "For the salad")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "tsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "chinese cabbage")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients29")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "head",  preparation: "cut into 1-2\" chunks" }])

ingredient = Ingredient.find_by(name: "cinnamon")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients34")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "0.5",  unit: "tsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "coconut oil")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients39")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.0",  unit: "tbsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "coriander seed")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "For the salad")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "1.5",  unit: "tsp",  preparation: "crushed" }])

ingredient = Ingredient.find_by(name: "courgette")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients22")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "0.5",  unit: "",  preparation: "" }])

ingredient = Ingredient.find_by(name: "creme fraiche")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients35")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "tbsp",  preparation: "(or mayo or yogurt)" }])

ingredient = Ingredient.find_by(name: "creme fraiche")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Main ingredients36")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "tbsp",  preparation: "" }])

ingredient = Ingredient.find_by(name: "cucumber")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "Veg")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "0.5",  unit: "",  preparation: nil }])

ingredient = Ingredient.find_by(name: "cumin seed")
 recipe_ingredient_group = RecipeIngredientGroup.find_by(name: "For the salad")
RecipeIngredient.create!([{ingredient_id: ingredient.id, recipe_ingredient_group_id: recipe_ingredient_group.id,  quantity: "2.0",  unit: "tsp",  preparation: "" }])