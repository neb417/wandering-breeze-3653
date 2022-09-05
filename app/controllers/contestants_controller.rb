class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @projects = ContestantProject.find_project
  end
end