Rails.application.routes.draw do
  get 'game/index'
  get 'game/wally'
  get 'game/wenda'
  get 'game/woof'
  get 'game/wbeard'
  get 'game/odlaw'

  root :to => 'game#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
