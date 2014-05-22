require 'sidekiq/web'
Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  get 'me', to: 'me#dashboard', as: 'me'
  resources :posts, path: 'news'

  resources :organisations



  devise_for :users
  resources :projects

  resources :fab_spaces, path: 'spaces' do
    member do
      get :join
      get :leave
    end
    collection do
      get :map
    end
  end

  %w(about).each do |word|
    get word => "static##{word}"
  end

  mount Sidekiq::Web => '/sidekiq'

  root to: 'static#home'

end
