Rails.application.routes.draw do


  resources :shifts, only: [:new, :create, :edit, :update, :index]
  resources :employees, only: [:show, :create, :new, :edit, :update]

  post 'employees/:id/deactivate',        to: 'employees#toggle_status',
                                          as: 'deactivate'
  post 'employees/:id/activate',          to: 'employees#toggle_status',
                                          as: 'activate'

  post 'schedules/:id/add_employees',     to: 'schedules#add_employees',
                                          as: 'add_employees'
  post 'schedules/:id/remove_employees',  to: 'schedules#remove_employees',
                                          as: 'remove_employees'
  get 'schedules/:id/set_schedule',       to: 'schedules#set_schedule',
                                          as: 'set_schedule'

  devise_for :admins, path: '',
                      path_names: {
                        sign_in: 'signin',
                        sign_out: 'signout',
                        sign_up: 'signup_for_an_account_admin'
                      },
                      controllers: {
                        registrations: 'registrations'
                      }
  resources :admins, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :schedules, only: [:show, :index, :new, :update, :edit, :create]
  root 'welcome#home'
end
