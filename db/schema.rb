# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110621203237) do

  create_table "article_variation_types", :force => true do |t|
    t.integer "article_id"
    t.integer "variation_type_id"
  end

  add_index "article_variation_types", ["article_id"], :name => "index_article_variation_types_on_article_id"
  add_index "article_variation_types", ["variation_type_id"], :name => "index_article_variation_types_on_variation_type_id"

  create_table "articles", :force => true do |t|
    t.string  "source"
    t.text    "title"
    t.text    "abstract"
    t.string  "doi"
    t.integer "variations_count", :default => 0
  end

  add_index "articles", ["variations_count"], :name => "index_articles_on_variations_count"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variation_types", :force => true do |t|
    t.string  "name"
    t.integer "articles_count", :default => 0
  end

  add_index "variation_types", ["articles_count"], :name => "index_variation_types_on_articles_count"
  add_index "variation_types", ["name"], :name => "index_variation_types_on_name"

end
