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

ActiveRecord::Schema[7.1].define(version: 2025_10_10_062728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesos", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.bigint "usuario_id", null: false
    t.bigint "nivel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nivel_id"], name: "index_accesos_on_nivel_id"
    t.index ["persona_id"], name: "index_accesos_on_persona_id"
    t.index ["usuario_id"], name: "index_accesos_on_usuario_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "estancias", force: :cascade do |t|
    t.bigint "modalidad_id", null: false
    t.bigint "tipoestancia_id", null: false
    t.integer "responsable"
    t.text "titulo"
    t.datetime "finicio"
    t.datetime "ftermino"
    t.text "tematica"
    t.text "notas"
    t.string "estado", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modalidad_id"], name: "index_estancias_on_modalidad_id"
    t.index ["tipoestancia_id"], name: "index_estancias_on_tipoestancia_id"
  end

  create_table "externoestancias", force: :cascade do |t|
    t.bigint "externo_id", null: false
    t.bigint "estancia_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estancia_id"], name: "index_externoestancias_on_estancia_id"
    t.index ["externo_id"], name: "index_externoestancias_on_externo_id"
  end

  create_table "externos", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.integer "cvu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_externos_on_persona_id"
  end

  create_table "finalizados", force: :cascade do |t|
    t.bigint "estancia_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estancia_id"], name: "index_finalizados_on_estancia_id"
  end

  create_table "modalidades", force: :cascade do |t|
    t.string "nommodal", limit: 100
    t.string "clave", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "niveles", force: :cascade do |t|
    t.string "nomnivel", limit: 100
    t.string "clave", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre", limit: 150
    t.string "apaterno", limit: 150
    t.string "amaterno", limit: 150
    t.bigint "tipopersona_id", null: false
    t.bigint "red_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["red_id"], name: "index_personas_on_red_id"
    t.index ["tipopersona_id"], name: "index_personas_on_tipopersona_id"
  end

  create_table "redes", force: :cascade do |t|
    t.string "nomred", limit: 150
    t.string "lugar", limit: 150
    t.string "tipored", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicitudes", force: :cascade do |t|
    t.bigint "estancia_id", null: false
    t.integer "validador"
    t.string "estado", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estancia_id"], name: "index_solicitudes_on_estancia_id"
  end

  create_table "tipoestancias", force: :cascade do |t|
    t.string "nomtipoes", limit: 50
    t.string "clave", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipopersonas", force: :cascade do |t|
    t.string "nomtipoper", limit: 3
    t.string "clave", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "accesos", "niveles"
  add_foreign_key "accesos", "personas"
  add_foreign_key "accesos", "usuarios"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "estancias", "modalidades"
  add_foreign_key "estancias", "tipoestancias"
  add_foreign_key "externoestancias", "estancias"
  add_foreign_key "externoestancias", "externos"
  add_foreign_key "externos", "personas"
  add_foreign_key "finalizados", "estancias"
  add_foreign_key "personas", "redes"
  add_foreign_key "personas", "tipopersonas"
  add_foreign_key "solicitudes", "estancias"
end
