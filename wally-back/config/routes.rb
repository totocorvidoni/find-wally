Rails.application.routes.draw do
  get 'game/index'
  get 'game/start'
  get 'game/scores'
  post 'game/score'
  post 'game/name'
  post 'game/wally'
  post 'game/wenda'
  post 'game/woof'
  post 'game/wbeard'
  post 'game/odlaw'
  post 'game/end'

  root to: 'game#index'
end
