Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  resources :products do 
    resources :reviews, shallow: true do 
    resources :categories, shallow: true 
    end

    end 
  #  get "/products", to: "products#index"
   get "/reviews", to: "reviews#index"
   get "/products", to: "products#index"
   #get "/categories", to: "categories#index"
end
