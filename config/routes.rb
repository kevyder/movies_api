# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#             api_v1_signup POST   /api/v1/signup(.:format)                                                                 api/v1/users#create {:format=>"json"}
#              api_v1_login POST   /api/v1/login(.:format)                                                                  api/v1/sessions#create {:format=>"json"}
#             api_v1_movies GET    /api/v1/movies(.:format)                                                                 api/v1/movies#index {:format=>"json"}
#                           POST   /api/v1/movies(.:format)                                                                 api/v1/movies#create {:format=>"json"}
#              api_v1_movie GET    /api/v1/movies/:id(.:format)                                                             api/v1/movies#show {:format=>"json"}
#                           PATCH  /api/v1/movies/:id(.:format)                                                             api/v1/movies#update {:format=>"json"}
#                           PUT    /api/v1/movies/:id(.:format)                                                             api/v1/movies#update {:format=>"json"}
#                           DELETE /api/v1/movies/:id(.:format)                                                             api/v1/movies#destroy {:format=>"json"}
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'signup' => 'users#create'
      post 'login' => 'sessions#create'
      resources :movies
    end
  end
end
