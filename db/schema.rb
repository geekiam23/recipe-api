# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_413_181_716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cuisine_recipes', force: :cascade do |t|
    t.bigint 'cuisine_id', null: false
    t.bigint 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cuisine_id'], name: 'index_cuisine_recipes_on_cuisine_id'
    t.index ['recipe_id'], name: 'index_cuisine_recipes_on_recipe_id'
  end

  create_table 'cuisines', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'diet_recipes', force: :cascade do |t|
    t.bigint 'diet_id', null: false
    t.bigint 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['diet_id'], name: 'index_diet_recipes_on_diet_id'
    t.index ['recipe_id'], name: 'index_diet_recipes_on_recipe_id'
  end

  create_table 'diets', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'dish_type_recipes', force: :cascade do |t|
    t.bigint 'dish_type_id', null: false
    t.bigint 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['dish_type_id'], name: 'index_dish_type_recipes_on_dish_type_id'
    t.index ['recipe_id'], name: 'index_dish_type_recipes_on_recipe_id'
  end

  create_table 'dish_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['recipe_id'], name: 'index_favorites_on_recipe_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'occasion_recipes', force: :cascade do |t|
    t.bigint 'occasion_id', null: false
    t.bigint 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['occasion_id'], name: 'index_occasion_recipes_on_occasion_id'
    t.index ['recipe_id'], name: 'index_occasion_recipes_on_recipe_id'
  end

  create_table 'occasions', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.integer 'servings'
    t.text 'summary'
    t.text 'instructions'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'cuisine_recipes', 'cuisines'
  add_foreign_key 'cuisine_recipes', 'recipes'
  add_foreign_key 'diet_recipes', 'diets'
  add_foreign_key 'diet_recipes', 'recipes'
  add_foreign_key 'dish_type_recipes', 'dish_types'
  add_foreign_key 'dish_type_recipes', 'recipes'
  add_foreign_key 'favorites', 'recipes'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'occasion_recipes', 'occasions'
  add_foreign_key 'occasion_recipes', 'recipes'
end
