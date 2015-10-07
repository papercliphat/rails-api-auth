require 'api_constraints'

Rails.application.routes.draw do
  get 'users/new'

  #Api definition
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do

    scope module: :v1,
      constraints: ApiConstraints.new(version:1, default: true) do
        resources :users, :only => [:show, :create, :update]
        resources :sessions, :only => [:create, :destroy]
      end
    end
end
