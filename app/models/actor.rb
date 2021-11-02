class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.actor_sort
    self.order('age')
  end

  def self.average_age
    self.all.average(:age)
  end

  def coactor
    #ugh!! just feel like I was right on the edge of getting this to work!
    @coactor = self.movies.references(:movie_actors).where(movie_actors.movie_id)
  end
end
