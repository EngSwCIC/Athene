Rails.application.routes.draw do
  resources :videos
  resources :users
  get 'registrar' => 'users#new'
  get 'admin' => 'users#index'
  get 'login' => 'autenticacao#login'
  get 'upload' => 'videos#new'

  match ':controller(/:action(/:id))', :via => :get #faz um match da controladora com uma action e uma id
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
