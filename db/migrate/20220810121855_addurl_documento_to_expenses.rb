class AddurlDocumentoToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :urlDocumento, :string
  end
end
