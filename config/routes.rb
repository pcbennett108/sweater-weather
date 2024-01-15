Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :forecast, only: :index
    end
    namespace :v1 do
      resources :munchies, only: :index
    end
  end
end