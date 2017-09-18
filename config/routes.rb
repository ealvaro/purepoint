Rails.application.routes.draw do
  resources :recipes, only: [:index] do
    collection do
        post 'search'
        get 'search'
    end
  end
  root 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
