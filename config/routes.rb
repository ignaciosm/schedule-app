Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/404', to: 'errors#not_found',             via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :available_times, only: [:new, :create, :edit, :update]
  resources :employees,       only: [:show, :create, :new, :edit, :update] do
    resources :status, only: :update
  end
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
    resources :shifts,              only: [:index, :create]
    resources :associate_employees, only: [:create, :destroy]
  end

  root 'welcome#home'
end
