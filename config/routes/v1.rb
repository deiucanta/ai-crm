namespace :v1 do

  get 'search', to: 'search#index'

  resources :companies do
    member do
      get :people
    end
  end

  resources :people do
    member do
      get :companies
    end
    resources :contact_methods
  end

  resources :notes
  resources :connections, only: [:create, :destroy]
end