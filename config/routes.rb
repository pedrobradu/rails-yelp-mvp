Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, except: [:update, :destroy, :edit] do
    resources :reviews, except: [:update, :destroy, :edit, :show]
  end
end
