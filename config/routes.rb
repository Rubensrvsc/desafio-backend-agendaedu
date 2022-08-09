require 'sidekiq/web'

Rails.application.routes.draw do
  get 'congress/index', to: 'congress#index'
  post 'congress/csv', to: 'congress#csv'
  get 'congress/list', to: 'congress#congress_list'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
