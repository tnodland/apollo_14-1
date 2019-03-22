require 'rails_helper'

RSpec.describe "astronaut index page" do
  context "as a visitor" do
    before :each do
      @a1 = Astronaut.create(name: "trevor", age: 24, job: "codenaut")
      @a2 = Astronaut.create(name: "spock", age: 56, job: "logic guy")
    end
    it "can see info about astronauts" do

      visit astronauts_path

      within "#astronaut-#{@a1.id}" do
        expect(page).to have_content("Name: #{@a1.name}")
        expect(page).to have_content("Age: #{@a1.age}")
        expect(page).to have_content("Job: #{@a1.job}")
      end

      within "#astronaut-#{@a2.id}" do
        expect(page).to have_content("Name: #{@a2.name}")
        expect(page).to have_content("Age: #{@a2.age}")
        expect(page).to have_content("Job: #{@a2.job}")
      end
    end

    it "can see average age" do
      visit astronauts_path

      within ".average_age" do
        expect(page).to have_content("Average Age: #{Astronaut.average_age}")
      end
    end
  end
end
