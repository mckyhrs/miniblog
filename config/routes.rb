Rails.application.routes.draw do
  get '/', to: redirect('/posts')
  resources :posts, only: %i[index new create]
end
