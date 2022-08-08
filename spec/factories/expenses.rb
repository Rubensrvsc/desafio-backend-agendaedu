FactoryBot.define do
  factory :expense do
    numSubCota { 1 }
    txtDescricao { 1 }
    numEspecificacaoSubCota { 1 }
    txtDescricaoEspecificacao { "MyString" }
    txtFornecedor { "MyString" }
    txtCNPJCPF { "MyString" }
    txtNumero { "MyString" }
    indTipoDocumento { "MyString" }
    datEmissao { "2022-08-08" }
    vlrDocumento { 1.5 }
    vlrGlosa { 1.5 }
    vlrLiquido { 1.5 }
    numMes { 1 }
    numAno { 1 }
    numParcela { 1 }
    txtPassageiro { "MyString" }
    txttrecho { "MyString" }
    numLote { 1 }
    numRessarcimento { 1 }
    vlrRestituicao { 1.5 }
    nuDeputadoId { 1 }
    ideDocumento { 1 }
    congressperson { nil }
  end
end
