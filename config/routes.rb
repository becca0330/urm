# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


URM::Application.routes.draw do
  
  resources :projects 
  resources :reports do
      collection do 
        get "ajax_add"
      end 
      member do
        get 'ajax_remove'
      end
  end
  # ajaxified methods new, update and destroy in the controller!
  resources :authors, 
        :persons, 
        :attributes_of_people, 
        :devices,
        :tasks, 
        :task_results,
        :questions,
        :answers,
        :interviews,
        :qandas,
        :findings,
        :documents,
        :videos,
        :transcript_events,
        :heuristics

  # TODO: use AJAX to manage (add/modify/remove)
  resources :eventcodes, :custom_attributes
  
  
  # user / admins / todo
  resources :todos
  
  # for authlogic sessions and users to login:
  resources :user_sessions
	match 'login' => "user_sessions#new",      :as => :login
	match 'logout' => "user_sessions#destroy", :as => :logout
  
  # give us our some normal resource routes for users
  resources :users  
  # a convenience route
  resource :user, :as => 'account', :only => [:show, :edit]  
  
  match 'signup' => 'users#new', :as => :signup
  
  
  # 2012-03-22 for url in registration mail
  match '/confirmation/:confirmation_code', :to => 'users#confirm', :as => :confirmation, :via => ["get","post"]
  
  
  resources :password_reset_request, :except => [:index, :show, :destroy]		
  
  
  root :to => "projects#index"
  
end
