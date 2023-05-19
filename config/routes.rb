Rails.application.routes.draw do
  resources :evaluations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get 'data/index'
  # get 'data'

  get 'data/index' => 'data#index', as: 'fetch_data'
  get 'data/student' => 'data#student', as: 'student'
  get 'data/admin' => 'data#admin', as: 'admin'
  get 'data/instructor' => 'data#instructor', as: 'instructor'
  get 'course_view/index' => 'course_view#index', as: 'course_view'
  get '/search' => 'course_view#search', as: 'search_courses'
  get '/courses/tag/:tag' => 'course_view#tag', as: 'courses_tag'
  get '/v1/recommendations/:student_application_id', to: 'recommendations#show'
  get '/courses/graders_needed' => 'course_view#graders_needed', as: 'courses_graders_needed'

  # root "articles#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }

  #Admin approves other users
  get 'approve' => 'approves#approve'

  #User is deleted here
  delete 'remove_user' => 'remove_users#delete'

  resources :user_approved do 
    put :approve, on: :member
    delete :disapprove, on: :member
  end

  #User is either assigned/denied postion of student grader
  put 'assign', to: 'grader_assigned#assign'
  put 'deny', to: 'grader_assigned#deny'
  
  resources :courses

  resources :sections

  resources :evaluations

  resources :student_applications
  
  #Landing page
  root to: "main#index"
end
