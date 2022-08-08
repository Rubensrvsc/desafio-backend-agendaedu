FactoryBot.define do
  factory :congressperson do
    txNomeParlamentar { "MyString" }
    cpf { "MyString" }
    ideCadastro { 1 }
    nuCarteiraParlamentar { 1 }
    sgUf { "MyString" }
    sgPartido { "MyString" }
    codLegislatura { 1 }
    nuLegislatura { 1 }
  end
end
