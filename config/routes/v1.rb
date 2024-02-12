namespace :v1 do
  resources :companies do
    collection do
      post :search
    end
    member do
      get :people
    end
  end

  resources :people do
    collection do
      post :search
    end
    member do
      get :companies
    end
    resources :contact_methods
  end

  resources :notes

  resources :connections, only: [:create, :destroy]
end