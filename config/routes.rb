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
        :transcript_events

  # TODO: use AJAX to manage (add/modify/remove)
  resources :eventcodes, :custom_attributes
  
  
  # user / admins / todo
  resources :todos
  
  root :to => "projects#index"
  
end
