Rails.application.routes.draw do


  resources :shifts, only: [:new, :create, :edit, :update, :index]
  resources :employees, only: [:show, :create, :new, :edit, :update]

  post 'employees/:id/deactivate', to: 'employees#toggle_status',
                                   as: 'deactivate'
  post 'employees/:id/activate', to: 'employees#toggle_status',
                                 as: 'activate'

  post 'schedules/:id/assign_shifts', to: 'schedules#assign_shifts',
                                      as: 'assign_shifts'
  post 'schedules/:id/unassign_shifts', to: 'schedules#unassign_shifts',
                                        as: 'unassign_shifts'

  post 'schedules/:id/assign_employees', to: 'schedules#assign_employees',
                                      as: 'assign_employees'
  post 'schedules/:id/unassign_employees', to: 'schedules#unassign_employees',
                                        as: 'unassign_employees'

  devise_for :admins, path: '',
                      path_names: {
                        sign_in: 'signin',
                        sign_out: 'signout',
                        sign_up: 'signup_for_an_account_admin'
                      }
  resources :admins, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :schedules, only: [:show, :index, :new, :update, :edit, :create]
  root 'welcome#home'
end
