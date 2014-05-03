Icount::Application.routes.draw do
  resources :client, :only => [:index, :show, :new, :create, :update]
  resources :main, :only => [:index]

  # Root path
  root :to => 'main#index'

end
