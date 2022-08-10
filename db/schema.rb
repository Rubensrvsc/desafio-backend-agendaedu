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

ActiveRecord::Schema.define(version: 2022_08_10_121855) do

  create_table "congresspeople", force: :cascade do |t|
    t.string "txNomeParlamentar"
    t.string "cpf"
    t.integer "ideCadastro"
    t.integer "nuCarteiraParlamentar"
    t.string "sgUf"
    t.string "sgPartido"
    t.integer "codLegislatura"
    t.integer "nuLegislatura"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "numSubCota"
    t.integer "txtDescricao"
    t.integer "numEspecificacaoSubCota"
    t.string "txtDescricaoEspecificacao"
    t.string "txtFornecedor"
    t.string "txtCNPJCPF"
    t.string "txtNumero"
    t.string "indTipoDocumento"
    t.date "datEmissao"
    t.float "vlrDocumento"
    t.float "vlrGlosa"
    t.float "vlrLiquido"
    t.integer "numMes"
    t.integer "numAno"
    t.integer "numParcela"
    t.string "txtPassageiro"
    t.string "txttrecho"
    t.integer "numLote"
    t.integer "numRessarcimento"
    t.float "vlrRestituicao"
    t.integer "nuDeputadoId"
    t.integer "ideDocumento"
    t.integer "congressperson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "urlDocumento"
    t.index ["congressperson_id"], name: "index_expenses_on_congressperson_id"
  end

  add_foreign_key "expenses", "congresspeople"
end
