Rails.application.routes.draw do


  devise_for :admins, path: '',
                      path_names: {
                        sign_in: 'signin',
                        sign_out: 'signout',
                        sign_up: 'signup'
                      },
                      controllers: {
                        registrations: 'registrations'
                      }
  resources :admins, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
end
