Rbklaser::Application.routes.draw do
  
  # deprecated chyba, tak w rails 3 jest calkiem inaczej
  #map.search 'exams/search', 'exams#search'
  
  match 'login' => 'users#login'
  match 'logout' => 'users#logout'
  match 'users/profile' => 'users#profile'
  match 'exams/search' => 'exams#search'
  
  #resources :exams, :has_many => :resources
  #resources :resources
  resources :exams do
    resources :resources
  end

  resources :users

  get "home/index"
  root :to => "home#index"

end
