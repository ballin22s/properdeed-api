Rails.application.routes.draw do
  
  namespace 'api', :defaults => { :format => 'json' } do
    namespace 'v1' do
      devise_for :users, controllers: { sessions: 'api/v1/sessions' },
      path_names: { sign_in: :login }
            
      resource :user, only: [:show, :update]
      
      resources :states
      resources :properties
      resources :services
      resources :vendors
      resources :vendor_addresses
      resources :supports
      resources :lists
      resources :list_items
    end
  end
    
  match '/help',   to: 'static_pages#help',   via: 'get'
  match '/privacy',   to: 'static_pages#privacy',   via: 'get'
end
