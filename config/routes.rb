Rails.application.routes.draw do
  
  
  ###get 'users/edit'
  devise_for :users
  
  #get 'users/edit'
  get 'home/about'
  #get '/', to: 'home#top', as: 'top'
  #root to: 'home#top'
  root :to => 'home#top'  
  
  resources :books, only: [:index, :create, :show, :edit, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  #get 'home/top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
