# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_17_030743) do

  create_table "aplicaciones", force: :cascade do |t|
    t.string "nombre", limit: 30
    t.string "version", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre", limit: 30, null: false
    t.integer "rol", null: false
    t.string "login", limit: 20
    t.string "password", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login"], name: "index_unique_login", unique: true
  end

  create_table "servicios", force: :cascade do |t|
    t.integer "servidor_id", null: false
    t.integer "aplicacion_id", null: false
    t.integer "puerto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aplicacion_id"], name: "index_servicios_on_aplicacion_id"
    t.index ["servidor_id"], name: "index_servicios_on_servidor_id"
  end

  create_table "servidores", force: :cascade do |t|
    t.string "nombre", limit: 60
    t.string "ip", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "empleado_id", null: false
    t.index ["empleado_id"], name: "index_servidores_on_empleado_id"
  end

  create_table "servidors", force: :cascade do |t|
    t.string "nombre", limit: 60
    t.string "ip", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "servicios", "aplicaciones"
  add_foreign_key "servicios", "servidores"
  add_foreign_key "servidores", "empleados"
end
