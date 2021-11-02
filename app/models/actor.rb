class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.actor_sort
    self.order('age')
  end

  def self.average_age
    self.all.average(:age)
  end
end
