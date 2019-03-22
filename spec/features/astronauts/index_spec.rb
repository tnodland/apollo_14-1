require 'rails_helper'

RSpec.describe "astronaut index page" do
  context "as a visitor" do
    before :each do
      @a1 = Astronaut.create(name: "trevor", age: 24, job: "codenaut")
      @a2 = Astronaut.create(name: "spock", age: 56, job: "logic guy")
      @m1 = @a1.missions.create(title: "snack run", time_in_space: 100)
      @m2 = @a1.missions.create(title: "mining the moon for rocks", time_in_space: 200)
      @m3 = @a2.missions.create(title: "saving the universe", time_in_space: 1000)
      @m4 = @a2.missions.create(title: "visiting mom", time_in_space: 300)
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

    it "can see a list of missions for each astronaut" do
      visit astronauts_path

      within "#astronaut-#{@a1.id}" do
        within "#missions" do
          expect(page).to have_content("#{@m1.title},")
          expect(page).to have_content("#{@m2.title},")
        end
      end

      within "#astronaut-#{@a2.id}" do
        within "#missions" do
          expect(page).to have_content("#{@m3.title},")
          expect(page).to have_content("#{@m4.title},")
        end
      end
    end
  end
end
