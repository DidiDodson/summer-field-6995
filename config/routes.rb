Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios', to: "studios#index"

  get 'movies/:id', to: "movies#show"
  post '/movies/:movie_id/actors', to: "movie_actors#create"

  get '/actors/:id', to: "actors#show"
end
