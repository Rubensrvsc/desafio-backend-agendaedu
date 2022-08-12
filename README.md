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

#### É necessário que o servidor do redis esteja instalado e para rodá-lo rode o comando

```
redis-server
```

#### Também é necessário que o sidekiq também esteja rodando, para isso rode

```
bundle exec sidekiq
```

### Funcionalidades

- Subir um csv com os dados dos deputados
- Colocar em um job para popular as tabelas
- Ver a lista de deputados do estado do Piauí
- Ver os 5 deputados que mais gastaram em 2021
- Ver a lista de despesas de cada deputado do estado do Piauí
