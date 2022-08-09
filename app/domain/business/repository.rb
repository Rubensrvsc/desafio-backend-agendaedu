module Business
    class Repository
        
        def all_congresspeople
            Congressperson.all
        end

        def sum_expenses_congressperson(congressperson_id)
            
        end

        def list_expenses(congressperson_id)
            Congressperson.find_by(id: congressperson_id).expenses.select(
                :datEmissao,
                :txtFornecedor,
                :vlrLiquido,
                :urlDocumento
            )
        end
    end
end