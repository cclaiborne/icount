Icount::Application.routes.draw do
  devise_for :iusers
  resources :client, :only => [:index, :show, :new, :create, :update] do
    resources :report, :only => [:new, :create, :index, :show, :update]  
  end

  resources :main, :only => [:index]

  # Root path
  root :to => 'main#index'

end
