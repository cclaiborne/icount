Icount::Application.routes.draw do
  resources :client do
    resources :report
  end

  resources :main, :only => [:index]

  # Root path
  root :to => 'main#index'

end

#, :only => [:index, :show, :new, :create, :update]
#, :only => [:new, :create, :index, :show, :update]
