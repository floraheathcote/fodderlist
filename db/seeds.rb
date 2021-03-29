User.create! :id => 1, :name => 'Flora Heathcote', :email => 'flora.heathcote+reciping@gmail.com', :password => 'monday', :password_confirmation => 'monday'

Pin.create!([
  {id: 1, description: "flooring", user_id: 1},
  {id: 2, description: "taps", user_id: 1},
  {id: 3, description: "tiles", user_id: 1},
  {id: 4, description: "bath", user_id: 1},
  {id: 5, description: "paint", user_id: 1},
  {id: 6, description: "fdaf", user_id: 1}
])

IngredientCategory.create!([
  {id: 3, name: "bakery"},
  {id: 4, name: "nuts & seeds"},
  {id: 2, name: "fruit, veg, salad"},
  {id: 6, name: "milk/butter/cream/cheese"},
  {id: 9, name: "herbs & spices"},
  {id: 10, name: "alcoholic drinks"},
  {id: 11, name: "soft drinks"},
  {id: 12, name: "tinned food (veg, fruit)"},
  {id: 13, name: "rice, pasta, pulses"},
  {id: 14, name: "tea & coffee, other hot drinks"},
  {id: 15, name: "frozen foods"},
  {id: 7, name: "eggs, flour, sugar, longlife milk"},
  {id: 16, name: "fresh pasta, ready meals, pizzas"},
  {id: 18, name: "honey, jam, chocolate spread"},
  {id: 19, name: "jars - olives, gherkins"},
  {id: 1, name: "fresh meat & fish"},
  {id: 17, name: "cooked meat, chilled olives, dips"},
  {id: 8, name: "oil, vinegar, soy sauce, table sauce, mustard"}
])

Ingredient.create!([
  {id: 9, name: "sesame oil", ingredient_category_id: 8, user_id: 1},
  {id: 15, name: "fresh ginger", ingredient_category_id: 2, user_id: 1},
  {id: 16, name: "brocolli", ingredient_category_id: 2, user_id: 1},
  {id: 2, name: "apples", ingredient_category_id: 2, user_id: 1},
  {id: 1, name: "beef fillet", ingredient_category_id: 1, user_id: 1},
  {id: 3, name: "chicken breast", ingredient_category_id: 1, user_id: 1},
  {id: 5, name: "peanuts", ingredient_category_id: 4, user_id: 1},
  {id: 4, name: "spring onions", ingredient_category_id: 2, user_id: 1},
  {id: 6, name: "sourdough - white", ingredient_category_id: 3, user_id: 1},
  {id: 7, name: "cornflour", ingredient_category_id: 7, user_id: 1},
  {id: 8, name: "mirin", ingredient_category_id: 8, user_id: 1},
  {id: 10, name: "soy sauce", ingredient_category_id: 8, user_id: 1},
  {id: 11, name: "sirloin steak", ingredient_category_id: 1, user_id: 1},
  {id: 13, name: "onion", ingredient_category_id: 2, user_id: 1},
  {id: 14, name: "garlic", ingredient_category_id: 2, user_id: 1},
  {id: 17, name: "red pepper", ingredient_category_id: 3, user_id: 1},
  {id: 19, name: "red chilli", ingredient_category_id: 2, user_id: 1},
  {id: 20, name: "honey", ingredient_category_id: 18, user_id: 1},
  {id: 21, name: "apple cider vinegar", ingredient_category_id: 8, user_id: 1},
  {id: 22, name: "white basmati rice", ingredient_category_id: 13, user_id: 1},
  {id: 23, name: "lime", ingredient_category_id: 2, user_id: 1},
  {id: 24, name: "fresh coriander / cilantro", ingredient_category_id: 2, user_id: 1},
  {id: 25, name: "avocado", ingredient_category_id: 2, user_id: 1},
  {id: 26, name: "cucumber", ingredient_category_id: 2, user_id: 1},
  {id: 28, name: "lemon", ingredient_category_id: 2, user_id: 1},
  {id: 12, name: "olive oil", ingredient_category_id: 8, user_id: 1},
  {id: 30, name: "frozen peas", ingredient_category_id: 15, user_id: 1},
  {id: 27, name: "cherry tomato", ingredient_category_id: 2, user_id: 1},
  {id: 29, name: "sausage", ingredient_category_id: 1, user_id: 1},
  {id: 18, name: "skin-on salmon fillet", ingredient_category_id: 1, user_id: 1}
])


Recipe.create!([
  {id: 1, name: "Beef stir fry - asian style", meal_type: "Main meal", method: "DIRECTIONS\r\nIn a medium bowl add 'marinade ingredients' (cornflour, mirin or dry sherry, sesame oil and reduced sodium soy sauce) and mix well.\r\nAdd the meat to the bowl and mix, making ensure all the slices are evenly coated. Set aside for 15 minutes so the beef could absorb the flavours.\r\nHeat wok or frypan, add oil, heat and add onion, garlic and ginger cook until soft but not browned.\r\nAdd thinly sliced beef with the marinade and cook over a high heat for 3 minutes.\r\nAdd the greens of your choice (example broccoli, Chinese broccoli, snow peas, bok choy or Asian greens) and beans.\r\nAdd water to the wok and mix scrapping the sauce on the bottom of the wok.\r\nCook until the vegetables are just tender but retain their vibrant green colour (approximately 4 minutes).\r\nEnjoy.", portions: "4.0", notes: "https://www.food.com/recipe/beef-stir-fry-asian-style-336781", user_id: 1},
  {id: 5, name: "Sausage and mash", meal_type: "Main meal", method: "mush potatoes, fry bangers", portions: "3.0", notes: "", user_id: 1},
  {id: 4, name: "Avocado & tomato salad", meal_type: "Side salad", method: "Chop it and mix it", portions: "2.0", notes: "", user_id: 1},
  {id: 3, name: "Roasted salmon with jalapeño, honey and lime", meal_type: "Main meal", method: "Heat the oven to 400 degrees. While the oven heats, combine the honey, jalapeños, vinegar and soy sauce in a small saucepan. Bring to a boil, then turn the heat to low and simmer for 10 minutes. Set aside.\r\nPat the salmon fillets dry using paper towels. Brush a 9-by-9-inch baking pan (or other similar-size baking pan or dish) with olive oil, then place the fillets in the pan, arranging them evenly without crowding. Brush the fillets generously with olive oil and sprinkle with salt. Pour the glaze and jalapeños over the salmon, spooning some of the glaze onto the fish as it collects in the bottom of the pan.\r\nRoast the salmon for 6 minutes, then baste with the glaze. Return to the oven and roast until the salmon is cooked through but still slightly rare in the center, another 6 to 8 minutes.\r\nSpoon the glaze in the pan over the salmon, then squeeze the lime over the salmon, and sprinkle with salt and cilantro, if using. Serve hot with rice on the side, pouring any glaze that remains in the pan over the rice.", portions: "4.0", notes: "https://cooking.nytimes.com/recipes/1020713-roasted-salmon-with-jalapeno-honey-and-lime", user_id: 1},
  {id: 7, name: "Roast chicken", meal_type: "Main meal", method: "1\r\nHeat the oven to 375°F. Fold the wings of the chicken across the back so tips are touching. There may be a little resistance, but once they are in this position, they will stay. Tie the legs to the tail with string or use skewers; if the tail is missing, tie the legs together.\r\n2\r\nIn a shallow roasting pan, place the chicken with the breast side up. Insert an ovenproof meat thermometer so the tip is in the thickest part of inside thigh and does not touch bone. Roast chicken uncovered 45 minutes.\r\n3\r\nWhile the chicken is roasting, peel the carrots, and cut into 1-inch pieces. Cut the celery into 1-inch pieces. Scrub the potatoes thoroughly with a vegetable brush or peel the potatoes, and cut into 1 1/2-inch pieces. Peel the onions, and cut into wedges.\r\n4\r\nRemove the chicken from the oven. Arrange the carrots, celery, potatoes and onions around the chicken. In a 1-quart saucepan, heat the butter over low heat just until melted. (Or place the butter in a small microwavable bowl; cover with a microwavable paper towel and microwave on High 10 to 20 seconds or until melted.) Stir the thyme into the butter, then drizzle over the chicken and vegetables.\r\n5\r\nCover the chicken and vegetables with foil; roast 45 to 60 minutes longer or until the thermometer reads 180°F and vegetables are tender when pierced with a fork. Or check for doneness by wiggling the legs; if they move easily, the chicken is done.\r\n6\r\nRemove the vegetables from the pan, and cover with foil to keep warm while carving the chicken.\r\n7\r\nPlace chicken, breast up and with its legs to your right if you're right-handed or to the left if left-handed, on cutting board. Remove ties from legs.", portions: "4.0", notes: "https://www.bettycrocker.com/recipes/thyme-roasted-chicken-with-vegetables/bab4dfa0-64a0-44c6-af1e-597317a6a363", user_id: 1}
])

RecipeIngredientGroup.create!([
  {id: 9, name: "For the marinade", recipe_id: 1},
  {id: 11, name: "For the wok", recipe_id: 1},
  {id: 12, name: "Garnish (optional)", recipe_id: 1},
  {id: 15, name: "Main ingredients", recipe_id: 3},
  {id: 17, name: "Veg", recipe_id: 4},
  {id: 18, name: "Dressing", recipe_id: 4},
  {id: 20, name: "All", recipe_id: 5},
  {id: 21, name: "Main ingredients", recipe_id: 7}
])

RecipeIngredient.create!([
  {id: 35, ingredient_id: 25, default_amount: "1.0", recipe_ingredient_group_id: 17, unit: ""},
  {id: 36, ingredient_id: 27, default_amount: "1.0", recipe_ingredient_group_id: 17, unit: "pack"},
  {id: 37, ingredient_id: 26, default_amount: "0.5", recipe_ingredient_group_id: 17, unit: ""},
  {id: 38, ingredient_id: 28, default_amount: "0.5", recipe_ingredient_group_id: 18, unit: ""},
  {id: 39, ingredient_id: 12, default_amount: "2.0", recipe_ingredient_group_id: 18, unit: "tablespoons"},
  {id: 41, ingredient_id: 21, default_amount: "0.5", recipe_ingredient_group_id: 18, unit: "tsp"},
  {id: 42, ingredient_id: 30, default_amount: "3.0", recipe_ingredient_group_id: 20, unit: "cups"},
  {id: 43, ingredient_id: 29, default_amount: "2.0", recipe_ingredient_group_id: 20, unit: ""},
  {id: 44, ingredient_id: 25, default_amount: "3.0", recipe_ingredient_group_id: 9, unit: ""},
  {id: 45, ingredient_id: 15, default_amount: "1.0", recipe_ingredient_group_id: 9, unit: "teaspoon"},
  {id: 46, ingredient_id: 18, default_amount: "4.0", recipe_ingredient_group_id: 15, unit: ""},
  {id: 47, ingredient_id: 20, default_amount: "0.5", recipe_ingredient_group_id: 15, unit: "cup"},
  {id: 48, ingredient_id: 21, default_amount: "2.0", recipe_ingredient_group_id: 15, unit: "tablespoons"},
  {id: 49, ingredient_id: 16, default_amount: "1.0", recipe_ingredient_group_id: 15, unit: "head"},
  {id: 32, ingredient_id: 1, default_amount: "3.0", recipe_ingredient_group_id: 9, unit: ""},
  {id: 33, ingredient_id: 21, default_amount: "2.0", recipe_ingredient_group_id: 9, unit: "tablespoons"}
])

ActiveStorage::Blob.create!([
  {id: 1, key: "mmfbe7dmmaz99w4vrcqp2e2ugzkf", filename: "Screenshot 2020-10-15 at 20.36.55.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 1136644, checksum: "hqhhG6MSTrLEpFWAnou9aA=="},
  {id: 2, key: "p8oe9ujp28ugvw5hjkp61d1gjmbf", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg=="},
  {id: 3, key: "wlqmi1x2xnrl4zmwdu9rhin4oha6", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg=="},
  {id: 4, key: "0xrtq4p871y1v1koh8egcrj03se0", filename: "download.jpeg", content_type: "image/jpeg", metadata: {}, byte_size: 3784, checksum: "LEQydKmMEyPyJ+LhuIxwGQ=="},
  {id: 5, key: "53hvekvdf33uqu5hhudemyqe9lk8", filename: "download.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 3784, checksum: "LEQydKmMEyPyJ+LhuIxwGQ=="},
  {id: 6, key: "j726e5moiqts026phitrf35dvgiz", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg=="},
  {id: 7, key: "g3b056sqm48f3ma31lo24awqzmbg", filename: "Screenshot 2020-10-15 at 17.04.10.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 162217, checksum: "GtPNqUmZiUItF/4wgSRkLw=="},
  {id: 8, key: "evd1tpyahr4v40xbq2vy1gk2kjn2", filename: "Screenshot 2020-11-25 at 12.17.34.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 634625, checksum: "W1xS7Hddj0fOVPPN9SCXNQ=="},
  {id: 9, key: "q344r7q0oxyubrwfi2tzfccy5upn", filename: "Screenshot 2020-10-14 at 09.39.43.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 477951, checksum: "6MOgEyvLR7PcP+F2PhTjNg=="},
  {id: 10, key: "ra5cjv3lz4mgvgcgtz2wlkdkxkr7", filename: "Screenshot 2020-08-31 at 18.23.47.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 95388, checksum: "mCsPbNX+rOxkNX8Bd+Uy+w=="},
  {id: 11, key: "mn65lxwno1s378zyl85ru3x5h456", filename: "Screenshot 2020-08-27 at 21.12.19.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 1250617, checksum: "W4w6iZnBnyuX8kS9c8OKlQ=="},
  {id: 12, key: "6lp6q18sq7j8ewgixhkdfc2p4ka4", filename: "beef-stirfry.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 44737, checksum: "fB6Nc2R6Jch47S/U9jIygw=="},
  {id: 13, key: "42yp0rp7rtnmsjfnpt5qad55lhq6", filename: "fresh-spring-onions_1080x.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 601400, checksum: "nGoVOiQsmgtiFeUiJqvIJA=="},
  {id: 14, key: "37q8odv7z6u57j4f94i1pn8v76pw", filename: "merlin_165684687_b76a3730-bb9c-44d6-9b56-fae20467eb5f-articleLarge.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 71462, checksum: "CpQyh9ngPF1UAtiDaF7lvQ=="},
  {id: 15, key: "sreno3p5s7bhf0q48ddrjki48kay", filename: "merlin_165684687_b76a3730-bb9c-44d6-9b56-fae20467eb5f-articleLarge.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 71462, checksum: "CpQyh9ngPF1UAtiDaF7lvQ=="},
  {id: 16, key: "m7a6tg06twnv1uek0yilj0gyhacm", filename: "images.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 14258, checksum: "6NC5utdGvHpbKAunlHgogw=="},
  {id: 17, key: "3p7otlf8z2ljblgj2mfl2gpcaj4c", filename: "Bangers-and-mash-feat.png", content_type: "image/png", metadata: {}, byte_size: 486865, checksum: "f+5ByN6Hc/prPMGUbXLFOw=="},
  {id: 18, key: "sohpt536q22rffj2pazoajgt6rdq", filename: "Bangers-and-mash-feat.png", content_type: "image/png", metadata: {}, byte_size: 486865, checksum: "f+5ByN6Hc/prPMGUbXLFOw=="},
  {id: 19, key: "vspap5vckk6f7hlj1exyo0g6gfkw", filename: "Bangers-and-mash-feat.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 486865, checksum: "f+5ByN6Hc/prPMGUbXLFOw=="},
  {id: 20, key: "saagrx7dmerhl82664gdncqq821t", filename: "2062f08d-bf7b-4aca-8cc4-59e339084bad.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 94661, checksum: "wj1+zuGRntXSgdvG5eMJ6w=="},
  {id: 21, key: "u9bw5fi60xm0t9ck7ywezp6q25xo", filename: "2062f08d-bf7b-4aca-8cc4-59e339084bad.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 94661, checksum: "wj1+zuGRntXSgdvG5eMJ6w=="}
])

ActiveStorage::Attachment.create!([
  {id: 1, name: "pin_image", record_type: "Pin", record_id: 1, blob_id: 1},
  {id: 2, name: "main_image", record_type: "Ingredient", record_id: 2, blob_id: 5},
  {id: 3, name: "main_image", record_type: "Ingredient", record_id: 1, blob_id: 6},
  {id: 4, name: "pin_image", record_type: "Pin", record_id: 2, blob_id: 7},
  {id: 5, name: "pin_image", record_type: "Pin", record_id: 3, blob_id: 8},
  {id: 6, name: "pin_image", record_type: "Pin", record_id: 4, blob_id: 9},
  {id: 7, name: "pin_image", record_type: "Pin", record_id: 5, blob_id: 10},
  {id: 8, name: "pin_image", record_type: "Pin", record_id: 6, blob_id: 11},
  {id: 9, name: "main_image", record_type: "Recipe", record_id: 1, blob_id: 12},
  {id: 10, name: "main_image", record_type: "Ingredient", record_id: 4, blob_id: 13},
  {id: 12, name: "main_image", record_type: "Recipe", record_id: 3, blob_id: 15},
  {id: 13, name: "main_image", record_type: "Recipe", record_id: 4, blob_id: 16},
  {id: 14, name: "main_image", record_type: "Recipe", record_id: 5, blob_id: 19},
  {id: 16, name: "main_image", record_type: "Recipe", record_id: 7, blob_id: 21}
])
