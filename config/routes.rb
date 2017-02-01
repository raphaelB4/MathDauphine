Rails.application.routes.draw do

  get 'exercices/show'

  get 'chapters/show'

  get 'sessions/new'

  root 'page_statique#hall'
  get '/hall', to: 'page_statique#hall'
  get '/chapitre1', to: 'chapitre#chapitre1'
  get '/chapitre2', to: 'chapitre#chapitre2'
  get 'page_statique/hall'
  get 'qcm/exercice1'
  post   '/repondre',   to: 'qcm#repondre'

  get  '/signup',  to: 'students#new'
  post '/signup',  to: 'students#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

 
  resources :eleves
  resources :students
  resources :chapters
  resources :exercices do
    member do
      post :correction
    end
  end

  mathjax 'mathjax'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
