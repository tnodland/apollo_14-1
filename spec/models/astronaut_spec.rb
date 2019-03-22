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
end
