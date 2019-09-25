Rails.application.routes.draw do
  root to: 'search_page#index'

  resource :processes, only: [:show]
end
