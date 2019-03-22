require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "Class Methods" do
    it ".average_age" do
      a1 = Astronaut.create(name: "trevor", age: 24, job: "codenaut")
      a2 = Astronaut.create(name: "spock", age: 56, job: "logic guy")

      expect(Astronaut.average_age).to eq(40)
    end
  end

  describe "instance methods" do
    it ".space_time" do
      a1 = Astronaut.create(name: "trevor", age: 24, job: "codenaut")
      a2 = Astronaut.create(name: "spock", age: 56, job: "logic guy")
      m1 = a1.missions.create(title: "snack run", time_in_space: 100)
      m2 = a1.missions.create(title: "mining the moon for rocks", time_in_space: 200)
      m3 = a2.missions.create(title: "saving the universe", time_in_space: 1000)
      m4 = a2.missions.create(title: "visiting mom", time_in_space: 300)

      expect(a1.space_time).to eq(300)
      expect(a2.space_time).to eq(1300)
    end
  end
end
