Rails.application.routes.draw do
    resources :users
    #root'users#index'
    resources :tweets
    #root'tweets#index'
    resources :tops
    post'top/login'
    get 'top/login_form'
    get'top/main'
    get 'top/logout'
    root'top#login_form'
    get 'top/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
