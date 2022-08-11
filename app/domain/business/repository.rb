module Business
    class Repository
        
        def all_congresspeople(page)
            Congressperson.page(page).per(5)
        end

        def sum_expenses_congressperson(congressperson_id)
            congressperson = Congressperson.find_by(id: congressperson_id)
            congressperson.expenses.sum(:vlrLiquido).round(2)
        end

        def list_expenses(congressperson_id, page)
            congressperson = Congressperson.find_by(id: congressperson_id)
            congressperson.expenses.select(
                :datEmissao,
                :txtFornecedor,
                :vlrLiquido,
                :urlDocumento
            ).page(page).per(5)
        end

        def get_ide_Cadastro(congressperson_id)
            Congressperson.find_by(id: congressperson_id).ideCadastro
        end

        def get_max_expense(congressperson_id)
            congressperson = Congressperson.find_by(id: congressperson_id)
            congressperson.expenses.maximum(:vlrLiquido).round(2)
        end

        def name_congressperson(congressperson_id)
            Congressperson.find_by(id: congressperson_id).txNomeParlamentar
        end

        def graph
            array = Congressperson.all.map { |congress| {"name": congress.txNomeParlamentar, "expense": congress.expenses.sum(:vlrLiquido).round(2)} }
            array.sort_by { |value| -value[:expense]}[0..4]
        end
    end
end