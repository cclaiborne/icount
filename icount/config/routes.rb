Icount::Application.routes.draw do
  get "report/new"
  get "report/create"
  get "report/index"
  get "report/show"
  get "report/update"
  resources :client, :only => [:index, :show, :new, :create, :update]
  resources :main, :only => [:index]

  # Root path
  root :to => 'main#index'

end
