Rails.application.routes.draw do
  root to: 'homepage#index'

  get 'homepage/index'
end
