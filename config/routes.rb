Rails.application.routes.draw do
  
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


 devise_for :admin, controllers: {
  sessions: "admin/sessions"
}


  scope module: :public do
    root :to => "homes#top"
    get "about" => "homes#about"
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information/edit' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/leave' => 'customers#leave'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get "items/:id/genre_search" => "items#search", as: "genre_search"
  end
  namespace :admin do
    root :to =>  'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_items, only: [:update]
    end
  end
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
