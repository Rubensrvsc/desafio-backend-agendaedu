class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :numSubCota
      t.integer :txtDescricao
      t.integer :numEspecificacaoSubCota
      t.string :txtDescricaoEspecificacao
      t.string :txtFornecedor
      t.string :txtCNPJCPF
      t.string :txtNumero
      t.string :indTipoDocumento
      t.date :datEmissao
      t.float :vlrDocumento
      t.float :vlrGlosa
      t.float :vlrLiquido
      t.integer :numMes
      t.integer :numAno
      t.integer :numParcela
      t.string :txtPassageiro
      t.string :txttrecho
      t.integer :numLote
      t.integer :numRessarcimento
      t.float :vlrRestituicao
      t.integer :nuDeputadoId
      t.integer :ideDocumento
      t.references :congressperson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
