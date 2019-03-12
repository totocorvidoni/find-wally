Rails.application.routes.draw do
  get 'game/index'
  get 'game/wally'

  root :to => 'game#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
