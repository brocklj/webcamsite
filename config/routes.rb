Rails.application.routes.draw do
  get 'home/welcome'

  root 'home#welcome'
  match '/welcome' => "home#welcome", via: :pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
