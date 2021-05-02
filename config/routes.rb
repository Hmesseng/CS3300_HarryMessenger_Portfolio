Rails.application.routes.draw do
  devise_for :students
  root "projects#index"
  devise_scope :student do

    root :to => 'devise/sessions#new'

  end

  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
