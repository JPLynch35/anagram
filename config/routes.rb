Rails.application.routes.draw do
  resources :words, only: [:create]
  namespace :anagrams do
    get '/:word.json', to: 'words#show'
  end
end
