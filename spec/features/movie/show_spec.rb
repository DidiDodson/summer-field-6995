require 'rails_helper'

RSpec.describe "movie show page" do
  it "should display movie attributes" do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: "Shrek", creation_year: 1997, genre: "Family Fun")


    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("#{movie_1.title}")
    expect(page).to have_content("#{movie_1.creation_year}")
    expect(page).to have_content("#{movie_1.genre}")
  end

  it "should list all actors from youngest to oldest" do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: "Shrek", creation_year: 1997, genre: "Family Fun")
    actor_1 = Actor.create!(name: "Mike Myers", age: 47)
    actor_2 = Actor.create!(name: "Cameron Diaz", age: 45)
    actor_3 = Actor.create!(name: "Betty White", age: 99)

    MovieActor.create!(movie: movie_1, actor: actor_1)
    MovieActor.create!(movie: movie_1, actor: actor_2)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("#{actor_1.name}")
    expect(page).to have_content("#{actor_2.name}")
    expect(page).to_not have_content("#{actor_3.name}")
    expect(movie_1.actors.actor_sort.first.name).to eq("#{actor_2.name}")

  end
end
