require 'rails_helper'

RSpec.describe "studio index page" do
  it "should display all studios" do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    studio_2 = Studio.create!(name: "Aloha Films", location: "Honolulu")
    studio_3 = Studio.create!(name: "Deseret Productions", location: "Salt Lake City")

    visit '/studios'

    expect(page).to have_content("#{studio_1.name}")
    expect(page).to have_content("#{studio_1.location}")
    expect(page).to have_content("#{studio_2.name}")
    expect(page).to have_content("#{studio_2.location}")
    expect(page).to have_content("#{studio_3.name}")
    expect(page).to have_content("#{studio_3.location}")
  end

  it 'should display all movie titles for a studio' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    movie_1 = studio_1.movies.create!(title: "Shrek", creation_year: 1997, genre: "Family Fun")
    movie_2 = studio_1.movies.create!(title: "Hunt for Red October", creation_year: 1993, genre: "Action/adventure")

    visit '/studios'

    expect(page).to have_content("#{movie_1.title}")
    expect(page).to have_content("#{movie_2.title}")
  end
end
