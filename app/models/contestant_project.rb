class ContestantProject < ApplicationRecord
  belongs_to :contestant
  belongs_to :project

  def self.find_project
    Project.select("projects.name, contestants.id").joins(:contestants)
  end
end