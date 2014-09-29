Rails.application.routes.draw do
  devise_for :users

  root "attempts#new"
  resources :questions do
    resources :answers
  end
  resources :attempts

end
