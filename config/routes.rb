Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "homepages#welcome"
  
  resources :resumes do
    member do
      get :view_user_resumes
      delete :destroy
    end
  end 
  
  resources :projects  

  resource :hobbies, only: [:new, :create]

  resources :educations  
end
