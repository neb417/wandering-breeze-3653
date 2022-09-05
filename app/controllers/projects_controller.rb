class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.find_project(@project.challenge_id)
  end
end