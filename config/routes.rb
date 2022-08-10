require 'sidekiq/web'

Rails.application.routes.draw do
  get 'congress/index', to: 'congress#index'
  post 'congress/csv', to: 'congress#upload_csv'
  get 'congress/list', to: 'congress#congress_list'
  get 'details/:id', to: 'congress#congressperson_details'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'congress#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
