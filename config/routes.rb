Apphera::Application.routes.draw do

  resources :system_settings

  resources :twitter_keywords

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :sentiments
      resources :keywords
      resources :organizations
      resources :uptime_monitors
    end
  end


  root :to => "home#index"

  devise_for :users
  resources :users, :only => :show
  resources :ProxiesApi


  resources :start

  resources :reviewers

  resources :accounts

  resources :rankings
  
  resources :fake_queue

  resources :keywords

  resources :misc

  match 'reviews/test' => 'reviews#index2'
  match 'reviewers2/test' => 'reviewers#index2'


  resources :reviews

  resources :aggregate_results

  match 'organizations/myorgs' => 'organizations#myorgs'
  match 'organizations/mapview' => 'organizations#mapview'

  resources :organizations

  resources :recommendations
  resources :uptime_monitors
  resources :my_competitors

  resources :history_items


  match 'resellers/setscope' => 'resellers#setscope', :as => :setscope
  
  mount Resque::Server, :at => "/resque"
  end




