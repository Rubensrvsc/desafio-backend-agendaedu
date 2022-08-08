class CreateCongresspeople < ActiveRecord::Migration[6.0]
  def change
    create_table :congresspeople do |t|
      t.string :txNomeParlamentar
      t.string :cpf
      t.integer :ideCadastro
      t.integer :nuCarteiraParlamentar
      t.string :sgUf
      t.string :sgPartido
      t.integer :codLegislatura
      t.integer :nuLegislatura

      t.timestamps
    end
  end
end
