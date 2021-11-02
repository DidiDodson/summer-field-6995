class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by_name(params[:name])
    @movie_actor = MovieActor.create(movie: movie, actor: actor)


    redirect_to "/movies/#{params[:movie_id]}"
  end
end
