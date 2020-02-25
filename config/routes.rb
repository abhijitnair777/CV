Rails.application.routes.draw do
  resources :user_projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "homepages#welcome"
  
  resource :sessions, path_names: { new: :login}, only: [:new, :create] do
    member do
      delete :logout
    end
  end

  resources :users
  
  resources :resumes
  
  resources :projects
  
  resources :skills

  resource :educations, only: [:new, :create]  
end
