Rails.application.routes.draw do
  get 'welcome/index'
  resources :videos
  resources :users
  resources :comments
  get 'registrar' => 'users#new'
  get 'admin' => 'users#index'
  get 'login' => 'autenticacao#login'
  post 'login(.:format)' => 'autenticacao#login'
  get 'upload' => 'videos#new'
  get 'error' => 'videos#show_error'
  get 'channel/(:user_name)' => 'videos#channel'
  post 'videos/(:id)/edit(.:format)' => 'videos#edit_video'
  get '/buscar' => 'busca#buscar'

  match ':controller(/:action(/:id))', :via => :get #faz um match da controladora com uma action e uma id
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
