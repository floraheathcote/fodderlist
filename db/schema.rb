# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_02_170552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "days", force: :cascade do |t|
    t.bigint "meal_plan_id", null: false
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "notes"
    t.string "holiday"
    t.index ["meal_plan_id"], name: "index_days_on_meal_plan_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "ingredient_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.bigint "ingredient_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", default: 1, null: false
    t.index ["ingredient_category_id"], name: "index_ingredients_on_ingredient_category_id"
    t.index ["user_id"], name: "index_ingredients_on_user_id"
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "quantity"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "meal_recipe_id"
    t.string "preparation"
    t.bigint "recipe_ingredient_id"
    t.index ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id"
    t.index ["meal_id"], name: "index_meal_ingredients_on_meal_id"
    t.index ["meal_recipe_id"], name: "index_meal_ingredients_on_meal_recipe_id"
    t.index ["recipe_ingredient_id"], name: "index_meal_ingredients_on_recipe_ingredient_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "meal_recipes", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "portions"
    t.index ["meal_id"], name: "index_meal_recipes_on_meal_id"
    t.index ["recipe_id"], name: "index_meal_recipes_on_recipe_id"
  end

  create_table "meals", force: :cascade do |t|
    t.boolean "favorite"
    t.text "notes"
    t.string "meal_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "day_id", null: false
    t.index ["day_id"], name: "index_meals_on_day_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "pins", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pins_on_user_id"
  end

  create_table "recipe_ingredient_groups", force: :cascade do |t|
    t.string "name"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_recipe_ingredient_groups_on_recipe_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "recipe_ingredient_group_id", default: 1, null: false
    t.string "unit"
    t.string "preparation"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_ingredient_group_id"], name: "index_recipe_ingredients_on_recipe_ingredient_group_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "meal_type"
    t.decimal "portions"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", default: 1, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "shopping_list_items", force: :cascade do |t|
    t.bigint "meal_plan_id", null: false
    t.bigint "ingredient_id", null: false
    t.boolean "ticked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "total_sum_unit"
    t.index ["ingredient_id"], name: "index_shopping_list_items_on_ingredient_id"
    t.index ["meal_plan_id"], name: "index_shopping_list_items_on_meal_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "days", "meal_plans"
  add_foreign_key "ingredients", "ingredient_categories"
  add_foreign_key "ingredients", "users"
  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "meal_recipes"
  add_foreign_key "meal_ingredients", "meals"
  add_foreign_key "meal_ingredients", "recipe_ingredients"
  add_foreign_key "meal_plans", "users"
  add_foreign_key "meal_recipes", "meals"
  add_foreign_key "meal_recipes", "recipes"
  add_foreign_key "meals", "days"
  add_foreign_key "pins", "users"
  add_foreign_key "recipe_ingredient_groups", "recipes"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipe_ingredient_groups"
  add_foreign_key "recipes", "users"
  add_foreign_key "services", "users"
  add_foreign_key "shopping_list_items", "ingredients"
  add_foreign_key "shopping_list_items", "meal_plans"
end
