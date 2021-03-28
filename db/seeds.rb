User.create!([
  {email: "flora.heathcote@gmail.com"}, 
  {password: "password"},
  {password_confirmation: "password"},
  {name: "Flora Heathcote"}
])


Recipe.create!([
  {name: "Beef stir fry - asian style", meal_type: "Main meal", method: "DIRECTIONS\r\nIn a medium bowl add 'marinade ingredients' (cornflour, mirin or dry sherry, sesame oil and reduced sodium soy sauce) and mix well.\r\nAdd the meat to the bowl and mix, making ensure all the slices are evenly coated. Set aside for 15 minutes so the beef could absorb the flavours.\r\nHeat wok or frypan, add oil, heat and add onion, garlic and ginger cook until soft but not browned.\r\nAdd thinly sliced beef with the marinade and cook over a high heat for 3 minutes.\r\nAdd the greens of your choice (example broccoli, Chinese broccoli, snow peas, bok choy or Asian greens) and beans.\r\nAdd water to the wok and mix scrapping the sauce on the bottom of the wok.\r\nCook until the vegetables are just tender but retain their vibrant green colour (approximately 4 minutes).\r\nEnjoy.", portions: "4.0", notes: "https://www.food.com/recipe/beef-stir-fry-asian-style-336781", user_id: 1},
  {name: "Sausage and mash", meal_type: "Main meal", method: "mush potatoes, fry bangers", portions: "3.0", notes: "", user_id: 1},
  {name: "Avocado & tomato salad", meal_type: "Side salad", method: "Chop it and mix it", portions: "2.0", notes: "", user_id: 1},
  {name: "Roasted salmon with jalapeño, honey and lime", meal_type: "Main meal", method: "Heat the oven to 400 degrees. While the oven heats, combine the honey, jalapeños, vinegar and soy sauce in a small saucepan. Bring to a boil, then turn the heat to low and simmer for 10 minutes. Set aside.\r\nPat the salmon fillets dry using paper towels. Brush a 9-by-9-inch baking pan (or other similar-size baking pan or dish) with olive oil, then place the fillets in the pan, arranging them evenly without crowding. Brush the fillets generously with olive oil and sprinkle with salt. Pour the glaze and jalapeños over the salmon, spooning some of the glaze onto the fish as it collects in the bottom of the pan.\r\nRoast the salmon for 6 minutes, then baste with the glaze. Return to the oven and roast until the salmon is cooked through but still slightly rare in the center, another 6 to 8 minutes.\r\nSpoon the glaze in the pan over the salmon, then squeeze the lime over the salmon, and sprinkle with salt and cilantro, if using. Serve hot with rice on the side, pouring any glaze that remains in the pan over the rice.", portions: "4.0", notes: "https://cooking.nytimes.com/recipes/1020713-roasted-salmon-with-jalapeno-honey-and-lime", user_id: 1},
  {name: "Roast chicken", meal_type: "Main meal", method: "1\r\nHeat the oven to 375°F. Fold the wings of the chicken across the back so tips are touching. There may be a little resistance, but once they are in this position, they will stay. Tie the legs to the tail with string or use skewers; if the tail is missing, tie the legs together.\r\n2\r\nIn a shallow roasting pan, place the chicken with the breast side up. Insert an ovenproof meat thermometer so the tip is in the thickest part of inside thigh and does not touch bone. Roast chicken uncovered 45 minutes.\r\n3\r\nWhile the chicken is roasting, peel the carrots, and cut into 1-inch pieces. Cut the celery into 1-inch pieces. Scrub the potatoes thoroughly with a vegetable brush or peel the potatoes, and cut into 1 1/2-inch pieces. Peel the onions, and cut into wedges.\r\n4\r\nRemove the chicken from the oven. Arrange the carrots, celery, potatoes and onions around the chicken. In a 1-quart saucepan, heat the butter over low heat just until melted. (Or place the butter in a small microwavable bowl; cover with a microwavable paper towel and microwave on High 10 to 20 seconds or until melted.) Stir the thyme into the butter, then drizzle over the chicken and vegetables.\r\n5\r\nCover the chicken and vegetables with foil; roast 45 to 60 minutes longer or until the thermometer reads 180°F and vegetables are tender when pierced with a fork. Or check for doneness by wiggling the legs; if they move easily, the chicken is done.\r\n6\r\nRemove the vegetables from the pan, and cover with foil to keep warm while carving the chicken.\r\n7\r\nPlace chicken, breast up and with its legs to your right if you're right-handed or to the left if left-handed, on cutting board. Remove ties from legs.", portions: "4.0", notes: "https://www.bettycrocker.com/recipes/thyme-roasted-chicken-with-vegetables/bab4dfa0-64a0-44c6-af1e-597317a6a363", user_id: 1}
])
IngredientCategory.create!([
  {name: "bakery"},
  {name: "nuts & seeds"},
  {name: "fruit, veg, salad"},
  {name: "milk/butter/cream/cheese"},
  {name: "herbs & spices"},
  {name: "alcoholic drinks"},
  {name: "soft drinks"},
  {name: "tinned food (veg, fruit)"},
  {name: "rice, pasta, pulses"},
  {name: "tea & coffee, other hot drinks"},
  {name: "frozen foods"},
  {name: "eggs, flour, sugar, longlife milk"},
  {name: "fresh pasta, ready meals, pizzas"},
  {name: "honey, jam, chocolate spread"},
  {name: "jars - olives, gherkins"},
  {name: "fresh meat & fish"},
  {name: "cooked meat, chilled olives, dips"},
  {name: "oil, vinegar, soy sauce, table sauce, mustard"}
])

])
RecipeIngredient.create!([
  {ingredient_id: 25, default_amount: "1.0", recipe_ingredient_group_id: 17, unit: ""},
  {ingredient_id: 27, default_amount: "1.0", recipe_ingredient_group_id: 17, unit: "pack"},
  {ingredient_id: 26, default_amount: "0.5", recipe_ingredient_group_id: 17, unit: ""},
  {ingredient_id: 28, default_amount: "0.5", recipe_ingredient_group_id: 18, unit: ""},
  {ingredient_id: 12, default_amount: "2.0", recipe_ingredient_group_id: 18, unit: "tablespoons"},
  {ingredient_id: 21, default_amount: "0.5", recipe_ingredient_group_id: 18, unit: "tsp"},
  {ingredient_id: 30, default_amount: "3.0", recipe_ingredient_group_id: 20, unit: "cups"},
  {ingredient_id: 29, default_amount: "2.0", recipe_ingredient_group_id: 20, unit: ""},
  {ingredient_id: 25, default_amount: "3.0", recipe_ingredient_group_id: 9, unit: ""},
  {ingredient_id: 15, default_amount: "1.0", recipe_ingredient_group_id: 9, unit: "teaspoon"},
  {ingredient_id: 18, default_amount: "4.0", recipe_ingredient_group_id: 15, unit: ""},
  {ingredient_id: 20, default_amount: "0.5", recipe_ingredient_group_id: 15, unit: "cup"},
  {ingredient_id: 21, default_amount: "2.0", recipe_ingredient_group_id: 15, unit: "tablespoons"},
  {ingredient_id: 16, default_amount: "1.0", recipe_ingredient_group_id: 15, unit: "head"},
  {ingredient_id: 1, default_amount: "3.0", recipe_ingredient_group_id: 9, unit: ""},
  {ingredient_id: 21, default_amount: "2.0", recipe_ingredient_group_id: 9, unit: "tablespoons"}
])

RecipeIngredientGroup.create!([
  {name: "For the marinade", recipe_id: 1},
  {name: "For the wok", recipe_id: 1},
  {name: "Garnish (optional)", recipe_id: 1},
  {name: "Main ingredients", recipe_id: 3},
  {name: "Veg", recipe_id: 4},
  {name: "Dressing", recipe_id: 4},
  {name: "All", recipe_id: 5},
  {name: "Main ingredients", recipe_id: 7}
])

Ingredient.create!([
  {name: "sesame oil", ingredient_category_id: 8, user_id: 1},
  {name: "fresh ginger", ingredient_category_id: 2, user_id: 1},
  {name: "brocolli", ingredient_category_id: 2, user_id: 1},
  {name: "apples", ingredient_category_id: 2, user_id: 1},
  {name: "beef fillet", ingredient_category_id: 1, user_id: 1},
  {name: "chicken breast", ingredient_category_id: 1, user_id: 1},
  {name: "peanuts", ingredient_category_id: 4, user_id: 1},
  {name: "spring onions", ingredient_category_id: 2, user_id: 1},
  {name: "sourdough - white", ingredient_category_id: 3, user_id: 1},
  {name: "cornflour", ingredient_category_id: 7, user_id: 1},
  {name: "mirin", ingredient_category_id: 8, user_id: 1},
  {name: "soy sauce", ingredient_category_id: 8, user_id: 1},
  {name: "sirloin steak", ingredient_category_id: 1, user_id: 1},
  {name: "onion", ingredient_category_id: 2, user_id: 1},
  {name: "garlic", ingredient_category_id: 2, user_id: 1},
  {name: "red pepper", ingredient_category_id: 3, user_id: 1},
  {name: "red chilli", ingredient_category_id: 2, user_id: 1},
  {name: "honey", ingredient_category_id: 18, user_id: 1},
  {name: "apple cider vinegar", ingredient_category_id: 8, user_id: 1},
  {name: "white basmati rice", ingredient_category_id: 13, user_id: 1},
  {name: "lime", ingredient_category_id: 2, user_id: 1},
  {name: "fresh coriander / cilantro", ingredient_category_id: 2, user_id: 1},
  {name: "avocado", ingredient_category_id: 2, user_id: 1},
  {name: "cucumber", ingredient_category_id: 2, user_id: 1},
  {name: "lemon", ingredient_category_id: 2, user_id: 1},
  {name: "olive oil", ingredient_category_id: 8, user_id: 1},
  {name: "frozen peas", ingredient_category_id: 15, user_id: 1},
  {name: "cherry tomato", ingredient_category_id: 2, user_id: 1},
  {name: "sausage", ingredient_category_id: 1, user_id: 1},
  {name: "skin-on salmon fillet", ingredient_category_id: 1, user_id: 1}
])

Pin.create!([
  {description: "flooring", user_id: 1},
  {description: "taps", user_id: 1},
  {description: "tiles", user_id: 1},
  {description: "bath", user_id: 1},
  {description: "paint", user_id: 1},
  {description: "fdaf", user_id: 1}
])
ActiveStorage::Blob.create!([
  {key: "mmfbe7dmmaz99w4vrcqp2e2ugzkf", filename: "Screenshot 2020-10-15 at 20.36.55.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 1136644, checksum: "hqhhG6MSTrLEpFWAnou9aA=="},
  {key: "p8oe9ujp28ugvw5hjkp61d1gjmbf", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg=="},
  {key: "wlqmi1x2xnrl4zmwdu9rhin4oha6", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg=="},
  {key: "0xrtq4p871y1v1koh8egcrj03se0", filename: "download.jpeg", content_type: "image/jpeg", metadata: {}, byte_size: 3784, checksum: "LEQydKmMEyPyJ+LhuIxwGQ=="},
  {key: "53hvekvdf33uqu5hhudemyqe9lk8", filename: "download.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 3784, checksum: "LEQydKmMEyPyJ+LhuIxwGQ=="},
  {key: "j726e5moiqts026phitrf35dvgiz", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg=="},
  {key: "g3b056sqm48f3ma31lo24awqzmbg", filename: "Screenshot 2020-10-15 at 17.04.10.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 162217, checksum: "GtPNqUmZiUItF/4wgSRkLw=="},
  {key: "evd1tpyahr4v40xbq2vy1gk2kjn2", filename: "Screenshot 2020-11-25 at 12.17.34.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 634625, checksum: "W1xS7Hddj0fOVPPN9SCXNQ=="},
  {key: "q344r7q0oxyubrwfi2tzfccy5upn", filename: "Screenshot 2020-10-14 at 09.39.43.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 477951, checksum: "6MOgEyvLR7PcP+F2PhTjNg=="},
  {key: "ra5cjv3lz4mgvgcgtz2wlkdkxkr7", filename: "Screenshot 2020-08-31 at 18.23.47.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 95388, checksum: "mCsPbNX+rOxkNX8Bd+Uy+w=="},
  {key: "mn65lxwno1s378zyl85ru3x5h456", filename: "Screenshot 2020-08-27 at 21.12.19.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 1250617, checksum: "W4w6iZnBnyuX8kS9c8OKlQ=="},
  {key: "6lp6q18sq7j8ewgixhkdfc2p4ka4", filename: "beef-stirfry.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 44737, checksum: "fB6Nc2R6Jch47S/U9jIygw=="},
  {key: "42yp0rp7rtnmsjfnpt5qad55lhq6", filename: "fresh-spring-onions_1080x.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 601400, checksum: "nGoVOiQsmgtiFeUiJqvIJA=="},
  {key: "37q8odv7z6u57j4f94i1pn8v76pw", filename: "merlin_165684687_b76a3730-bb9c-44d6-9b56-fae20467eb5f-articleLarge.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 71462, checksum: "CpQyh9ngPF1UAtiDaF7lvQ=="},
  {key: "sreno3p5s7bhf0q48ddrjki48kay", filename: "merlin_165684687_b76a3730-bb9c-44d6-9b56-fae20467eb5f-articleLarge.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 71462, checksum: "CpQyh9ngPF1UAtiDaF7lvQ=="},
  {key: "m7a6tg06twnv1uek0yilj0gyhacm", filename: "images.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 14258, checksum: "6NC5utdGvHpbKAunlHgogw=="},
  {key: "3p7otlf8z2ljblgj2mfl2gpcaj4c", filename: "Bangers-and-mash-feat.png", content_type: "image/png", metadata: {}, byte_size: 486865, checksum: "f+5ByN6Hc/prPMGUbXLFOw=="},
  {key: "sohpt536q22rffj2pazoajgt6rdq", filename: "Bangers-and-mash-feat.png", content_type: "image/png", metadata: {}, byte_size: 486865, checksum: "f+5ByN6Hc/prPMGUbXLFOw=="},
  {key: "vspap5vckk6f7hlj1exyo0g6gfkw", filename: "Bangers-and-mash-feat.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 486865, checksum: "f+5ByN6Hc/prPMGUbXLFOw=="},
  {key: "saagrx7dmerhl82664gdncqq821t", filename: "2062f08d-bf7b-4aca-8cc4-59e339084bad.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 94661, checksum: "wj1+zuGRntXSgdvG5eMJ6w=="},
  {key: "u9bw5fi60xm0t9ck7ywezp6q25xo", filename: "2062f08d-bf7b-4aca-8cc4-59e339084bad.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 94661, checksum: "wj1+zuGRntXSgdvG5eMJ6w=="}
])
ActiveStorage::Attachment.create!([
  {name: "pin_image", record_type: "Pin", record_id: 1, blob_id: 1},
  {name: "main_image", record_type: "Ingredient", record_id: 2, blob_id: 5},
  {name: "main_image", record_type: "Ingredient", record_id: 1, blob_id: 6},
  {name: "pin_image", record_type: "Pin", record_id: 2, blob_id: 7},
  {name: "pin_image", record_type: "Pin", record_id: 3, blob_id: 8},
  {name: "pin_image", record_type: "Pin", record_id: 4, blob_id: 9},
  {name: "pin_image", record_type: "Pin", record_id: 5, blob_id: 10},
  {name: "pin_image", record_type: "Pin", record_id: 6, blob_id: 11},
  {name: "main_image", record_type: "Recipe", record_id: 1, blob_id: 12},
  {name: "main_image", record_type: "Ingredient", record_id: 4, blob_id: 13},
  {name: "main_image", record_type: "Recipe", record_id: 3, blob_id: 15},
  {name: "main_image", record_type: "Recipe", record_id: 4, blob_id: 16},
  {name: "main_image", record_type: "Recipe", record_id: 5, blob_id: 19},
  {name: "main_image", record_type: "Recipe", record_id: 7, blob_id: 21}
])
