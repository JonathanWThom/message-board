Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts, :except => [:edit] do
    resources :comments, :only => [:new, :create]
  end
end
