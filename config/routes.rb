Rails.application.routes.draw do
  get 'game/index'
  post 'game/wally'
  post 'game/wenda'
  post 'game/woof'
  post 'game/wbeard'
  post 'game/odlaw'

  root to: 'game#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
