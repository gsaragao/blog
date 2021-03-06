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

ActiveRecord::Schema.define(:version => 20110620132857) do

  create_table "artigos", :force => true do |t|
    t.string   "titulo"
    t.text     "corpo"
    t.datetime "publicacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resumo"
    t.string   "localizacao"
    t.integer  "usuario_id"
  end

  create_table "artigos_categorias", :id => false, :force => true do |t|
    t.integer "artigo_id"
    t.integer "categoria_id"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", :force => true do |t|
    t.integer  "artigo_id"
    t.string   "nome"
    t.string   "email"
    t.text     "corpo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfils", :force => true do |t|
    t.integer  "usuario_id"
    t.string   "nome"
    t.date     "aniversario"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "usuarios", :force => true do |t|
    t.string   "email"
    t.string   "hash_senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
