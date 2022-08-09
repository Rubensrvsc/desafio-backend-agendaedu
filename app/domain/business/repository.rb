module Business
    class Repository
        
        def all_congresspeople(page)
            Congressperson.page(page).per(5)
        end

        def sum_expenses_congressperson(congressperson_id)
            Congressperson.find_by(id: congressperson_id).expenses.sum(:vlrLiquido)
        end

        def list_expenses(congressperson_id, page)
            Congressperson.find_by(id: congressperson_id).expenses.select(
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
            Congressperson.find_by(id: congressperson_id).expenses.maximum(:vlrLiquido)
        end
    end
end