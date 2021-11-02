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
end
