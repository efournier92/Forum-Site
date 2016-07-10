ActiveRecord::Schema.define(version: 20160323221342) do

  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "question_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.text     "description",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
