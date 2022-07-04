Rails.application.routes.draw do
  devise_for :users
  
  resources :questions do
    resources :answers, shallow: true, except: %i[index show new]
  end 

  root to: 'questions#index' 
end
