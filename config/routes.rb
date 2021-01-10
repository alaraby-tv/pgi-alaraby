Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :ages
    resources :attachments
    resources :broadcast_media
    resources :broadcasting_frequencies
    resources :categories
    resources :departments
    resources :durations
    resources :educations
    resources :episodes
    resources :genders
    resources :genres
    resources :marketing_materials
    resources :material_types
    resources :natures
    resources :parts
    resources :permissions
    resources :product_types
    resources :products
    resources :production_companies
    resources :regions
    resources :roles
    resources :viewing_forms
    resources :guests
    resources :presenters
    resources :events
    resources :product_emails
    resources :episode_emails
    resources :attachment_emails

    root to: "users#index"
  end
  
  resources :products, only: [:new, :create, :show, :index, :destroy] do
    resources :permissions
    resources :production_companies, only: :index
    # resources :viewing_forms, except: :index
    resources :marketing_materials do
      member do
        post :remove_attachment
      end
    end
    resources :steps, only: [:show, :update], controller: 'products/steps'
    resources :episodes do
      resources :marketing_materials, controller: 'episodes/marketing_materials' do
        member do
          post :remove_attachment
        end
      end
      # resources :viewing_forms, except: :index, controller: 'episodes/viewing_forms'
    end
    collection do
      get :owned
      get :single
      get :multi_episode
      get :shared
    end
  end
  resources :permissions
  resources :attachments, only: [:create, :show]
  resources :guests
  devise_for :users, skip: [:sessions, :registrations]
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    root 'devise/sessions#new'
    get '/sign_in' => 'devise/sessions#new', as: :new_user_session
    post '/sign_in' => 'devise/sessions#create', as: :user_session
    delete '/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session

    get 'users/edit' => 'devise/registrations#edit', as: :edit_user_registration    
    put 'users' => 'devise/registrations#update', as: :user_registration
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
