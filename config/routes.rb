Rails.application.routes.draw do
  mount OpenApi::Rswag::Ui::Engine => '/api-docs'
  mount OpenApi::Rswag::Api::Engine => '/api-docs'
  get 'api/users', to: "users#index"
  get 'api/users/:id', to: "users#show", as: 'show_user'
  #resources :users, only: [:new, :edit]
  post 'api/users', to: "users#create"
  patch 'api/users/:id', to: "users#update", as: 'update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
