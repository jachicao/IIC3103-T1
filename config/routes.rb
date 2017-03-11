Rails.application.routes.draw do
  resources :home do
    collection do
      get 'administrate'
      get 'logout'
    end
  end
  root :to => "articles#index"
  resources :articles do
  	resources :comments do

  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
