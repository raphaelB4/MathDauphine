Rails.application.routes.draw do
  get 'eleve/nouveau'

  get '/chapitre1', to: 'chapitre#chapitre1'
  get '/chapitre2', to: 'chapitre#chapitre2'

  root 'page_statique#hall'
  get 'page_statique/hall'
  get 'qcm/exercice1'
  post   '/repondre',   to: 'qcm#repondre'
 
  resources :eleves
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
