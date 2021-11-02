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
  end

end
