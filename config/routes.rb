Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/404', to: 'errors#not_found',             via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :available_times, only: [:new, :create, :edit, :update]
  resources :employees,       only: [:show, :create, :new, :edit, :update]

  post 'employees/:id/deactivate',        to: 'employees#toggle_status',
                                          as: 'deactivate'
  post 'employees/:id/activate',          to: 'employees#toggle_status',
                                          as: 'activate'

  post 'schedules/:id/add_employees',     to: 'schedules#add_employees',
                                          as: 'add_employees'
  post 'schedules/:id/remove_employees',  to: 'schedules#remove_employees',
                                          as: 'remove_employees'
  # get  'schedules/:id/set_schedule',      to: 'schedules#set_schedule',
  #                                         as: 'set_schedule'
  get  'schedules/:id/print_schedule',    to: 'schedules#print_schedule',
                                          as: 'print_schedule'
  # post 'schedules/:id/set_schedule',      to: 'shifts#set_shifts',
  #                                         as: 'set_shifts'

  devise_for :admins, path: '',
                      path_names: {
                        sign_in: 'signin',
                        sign_out: 'signout',
                        sign_up: 'signup_for_an_account_admin'
                      },
                      controllers: {
                        registrations: 'registrations'
                      }
  resources :admins,    only: [:show]
  resources :schedules, only: [:show, :index, :new, :create] do
    resources :shifts, only: [:index, :create]
  end
  root 'welcome#home'
end
