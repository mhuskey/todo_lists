Rails.application.routes.draw do
  
  root 'lists#index'
  
  resources :lists do
    resources :items do
      member do
        patch :complete
      end
    end
  end
  
end
