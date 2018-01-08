Rails.application.routes.draw do
  root :to => redirect('/shortened_urls/new')
  resources :shortened_urls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
