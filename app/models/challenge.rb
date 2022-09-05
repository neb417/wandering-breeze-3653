class Challenge < ApplicationRecord
  validates_presence_of :theme, :project_budget
  has_many :projects

  def self.find_project(param)
    Challenge.find(param)
  end
end