Rails.application.routes.draw do
  devise_for :students
  root "projects#index"
  resources :projects
  #devise_scope :student do

    #root :to => 'devise/sessions#new'

 # end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
