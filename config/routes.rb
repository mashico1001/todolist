Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'homes#top'
  
  resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy] do
    member do
      post 'done'
    end
  end
  
  
end
