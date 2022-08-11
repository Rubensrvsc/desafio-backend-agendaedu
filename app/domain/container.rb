# require 'dry-auto_inject'

module Container
    MyContainer = Dry::Container.new
  
    MyContainer.register(:repo) { Business::Repository.new }
    MyContainer.register(:worker_register_expenses) { Workers::RegisterExpenses }
  
    Import = Dry::AutoInject(MyContainer)
end