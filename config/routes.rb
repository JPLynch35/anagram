Rails.application.routes.draw do
  resources :words, only: [:create]
  get 'anagrams/:word.json', to: 'anagrams#show'
end
