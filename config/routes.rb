Rails.application.routes.draw do
  root to: 'search_page#index'

  get 'search_page/index'
end
