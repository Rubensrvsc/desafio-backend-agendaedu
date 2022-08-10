require 'dry/monads'
require 'csv'

module Business
    class RegisterValues
        include Dry::Monads[:result, :do]
    
        def call(csv_path)
            get_rows_from_uf = yield get_validated_rows(csv_path)
            congress_person = yield register_congressperson(get_rows_from_uf)
            expenses_congressperson = yield register_expenses(congress_person)
            deleted_csv = yield delete_csv(csv_path)

            Success(deleted_csv)
        end

        def get_validated_rows(csv_path)
            count = 0
            rows = []
            CSV.foreach(csv_path, "r:bom|utf-8", { headers: true, col_sep: ';' }) do |row|
                if row["sgUF"] == "PI" 
                    count = count + 1
                    rows << row.to_h
                end
            end

            Success(rows)
        end

        def register_congressperson(rows)
            rows.each do |row|
                Congressperson.where(
                    txNomeParlamentar: row["txNomeParlamentar"],
                    cpf: row["cpf"],
                    ideCadastro: row["ideCadastro"].to_i,
                    nuCarteiraParlamentar: row["nuCarteiraParlamentar"].to_i,
                    sgUf: row["sgUf"],
                    sgPartido: row["sgPartido"],
                    codLegislatura: row["codLegislatura"].to_i,
                    nuLegislatura: row["nuLegislatura"].to_i
                ).first_or_create
            end
            Success(rows)
        end

        def register_expenses(rows)
            rows.each do |row|
                congressperson = Congressperson.find_by(ideCadastro: row["ideCadastro"])
                if congressperson.present?
                    create_expense(row, congressperson.id)
                end
            end
            Success(rows)
        end

        def delete_csv(csv_path)
            File.delete(csv_path)
            Success('Arquivo deletado com sucesso')
        end

        def create_expense(row, congressperson_id)
            Expense.create!(
                numSubCota: row["numSubCota"].to_i,
                txtDescricao: row["txtDescricao"],
                numEspecificacaoSubCota: row["numEspecificacaoSubCota"].to_i,
                txtDescricaoEspecificacao: row["txtDescricaoEspecificacao"],
                txtFornecedor: row["txtFornecedor"],
                txtCNPJCPF: row["txtCNPJCPF"],
                txtNumero: row["txtNumero"],
                indTipoDocumento: row["indTipoDocumento"].to_i,
                datEmissao: row["datEmissao"].to_date,
                vlrDocumento: row["vlrDocumento"].to_f,
                vlrGlosa: row["vlrGlosa"].to_f,
                vlrLiquido: row["vlrLiquido"].to_f,
                numMes: row["numMes"].to_i,
                numAno: row["numAno"].to_i,
                numParcela: row["numParcela"].to_i,
                txtPassageiro: row["txtPassageiro"],
                txttrecho: row["txttrecho"],
                numLote: row["numLote"].to_i,
                numRessarcimento: row["numRessarcimento"].to_i,
                vlrRestituicao: row["vlrRestituicao"].to_f,
                nuDeputadoId: row["nuDeputadoId"].to_i,
                ideDocumento: row["ideDocumento"].to_i,
                urlDocumento: row["urlDocumento"].to_s,
                congressperson_id: congressperson_id
            )
        end
    end 
end