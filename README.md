## Repositorio do teste de backend na Agenda Edu

### Tecnologias usadas

```
Ruby
Ruby On Rails
Bootstrap
WebPack
Kaminari
Sidekiq
Redis
RSpec
DatabaseCleaner
```

### Para rodar o projeto

#### Clonar o projeto

```
git clone https://github.com/Rubensrvsc/desafio-backend-agendaedu.git
```

#### Entrar no projeto

```
cd desafio-backend-agendaedu
```

#### Instalar as depêndencias

```
Bundle install
```

#### Criar o Banco de dados

```
bundle exec rails db:create
```

#### Executar as migrações

```
bundle exec rails db:migrate
```

#### Compilar os assets

```
bundle exec rake assets:precompile
```

#### Subir a aplicação

```
bundle exec rails s
```

#### Para entrar no console

```
bundle exec rails c
```

#### Rodar os testes

```
bundle exec rspec spec
```

#### É necessário que o servidor do [redis](https://redis.io/docs/getting-started/installation/install-redis-on-linux/) esteja instalado e para rodá-lo rode o comando

```
redis-server
```

#### Também é necessário que o [sidekiq](https://github.com/mperham/sidekiq) também esteja rodando, para isso rode

```
bundle exec sidekiq
```

### Funcionalidades

- Subir um csv com os dados dos deputados
  - Caso já tenha dados nas tabelas do banco de dados não é possível gravar dados no banco de dados
- Colocar em um job para popular as tabelas
- Ver a lista de deputados do estado do Piauí
- Ver os 5 deputados que mais gastaram em 2021
- Ver a lista de despesas de cada deputado do estado do Piauí
- Ver o somatório de despesa e a maior despesa de um deputado
