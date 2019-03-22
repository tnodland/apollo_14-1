class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many  :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    Astronaut.average(:age)
  end

  def space_time
    missions.sum(:time_in_space)
  end
end
