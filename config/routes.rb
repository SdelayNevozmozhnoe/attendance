Rails.application.routes.draw do
  get 'teacher_sessions/new'
  get 'teachers/new'
  get 'teachers/create'
  get 'teachers/show'
  get 'teachers/edit'
  get 'teachers/update'
  delete 'teachers/destroy'
  get '/teacher_login', to: 'teacher_sessions#new'
  post '/teacher_login', to: 'teacher_sessions#create'
  delete '/teacher_logout', to: 'teacher_sessions#destroy'
  get '/teacher_signup', to: 'teachers#new'
  get '/student_signup', to: 'students#new'
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
