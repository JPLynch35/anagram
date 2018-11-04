Rails.application.routes.draw do
  resources :words, only: [:create]
  delete 'words/:word', to: 'words#destroy'
  delete 'words', to: 'anagrams#destroy'
  get 'anagrams/:word', to: 'anagrams#show'
end
