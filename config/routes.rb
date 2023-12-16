# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'ie_statements#index'
  resources :ie_statements

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
