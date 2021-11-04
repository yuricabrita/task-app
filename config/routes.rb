Rails.application.routes.draw do
  root 'lists#index'

  resources :lists
  resources :tasks do
    member do
      post 'complete'
    end

    collection do
      get 'incompleted'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
