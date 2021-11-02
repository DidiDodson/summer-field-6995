require 'rails_helper'

RSpec.describe "actor show page" do
  it "should display actor attributes" do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: "Shrek", creation_year: 1997, genre: "Family Fun")
    actor_1 = Actor.create!(name: "Mike Myers", age: 47)

    MovieActor.create!(movie: movie_1, actor: actor_1)

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content("#{actor_1.name}")
    expect(page).to have_content("#{actor_1.age}")
  end

  xit "should display co-actor names" do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: "Shrek", creation_year: 1997, genre: "Family Fun")
    actor_1 = Actor.create!(name: "Mike Myers", age: 47)
    actor_2 = Actor.create!(name: "Cameron Diaz", age: 45)
    actor_3 = Actor.create!(name: "Betty White", age: 99)
    actor_4 = Actor.create!(name: "Eddie Murphy", age: 50)

    MovieActor.create!(movie: movie_1, actor: actor_1)
    MovieActor.create!(movie: movie_1, actor: actor_2)
    MovieActor.create!(movie: movie_1, actor: actor_4)

    visit "/actors/#{actor_1.id}"

    within("#coactors") do
      expect(page).to have_content("#{actor_2.name}")
      expect(page).to have_content("#{actor_4.name}")
    end
  end
end
