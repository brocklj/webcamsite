Rails.application.routes.draw do
  get 'home/welcome'
  post 'home/welcome'
  get 'home/get_images'
  resources :home

  root 'home#welcome'
  match '/welcome' => "home#welcome", via: :pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
