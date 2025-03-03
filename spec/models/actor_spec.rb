require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "methods" do
    it "sorts actors by age" do
      actor_1 = Actor.create!(name: "Mike Myers", age: 47)
      actor_2 = Actor.create!(name: "Cameron Diaz", age: 45)
      actor_3 = Actor.create!(name: "Betty White", age: 99)

      sorted = Actor.actor_sort

      expect(sorted.first).to eq(actor_2)
      expect(sorted.last).to eq(actor_3)
    end

    it "sorts actors by age" do
      actor_1 = Actor.create!(name: "Mike Myers", age: 47)
      actor_2 = Actor.create!(name: "Cameron Diaz", age: 45)
      actor_3 = Actor.create!(name: "Betty White", age: 99)

      expect(Actor.average_age.round(2)).to eq(63.67)
    end

    xit "shows coactors" do
      studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie_1 = studio_1.movies.create!(title: "Shrek", creation_year: 1997, genre: "Family Fun")
      actor_1 = Actor.create!(name: "Mike Myers", age: 47)
      actor_2 = Actor.create!(name: "Cameron Diaz", age: 45)

      MovieActor.create!(movie: movie_1, actor: actor_1)
      MovieActor.create!(movie: movie_1, actor: actor_2)

      expect(actor_1.coactor).to eq(actor_2)
    end
  end

end
