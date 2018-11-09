Rails.application.routes.draw do
  resources :words, only: [:create]
  delete 'words/:word', to: 'words#destroy'
  
  get 'anagrams/:word', to: 'anagrams#show'
  delete 'words', to: 'anagrams#destroy'
end
