Rbklaser::Application.routes.draw do
  
  # deprecated chyba, tak w rails 3 jest calkiem inaczej
  #map.search 'exams/search', 'exams#search'
  
  match 'login' => 'users#login'
  match 'logout' => 'users#logout'
  match 'users/profile' => 'users#profile'
  match 'exams/search' => 'exams#search'
  
  resources :resources, :exam, :users

  resources :users

  get "home/index"
  root :to => "home#index"

end
