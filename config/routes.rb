Rails.application.routes.draw do
  root to: redirect('/posts')
  resources :posts, only: %i[index new create]
end
