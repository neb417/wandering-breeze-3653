require 'rails_helper'

RSpec.describe "Project show page" do
  
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  descirbe 'User Story 1: As a visitor' do
    descirbe "When I visit a project's show page ('/projects/:id')" do
      it 'route exists' do
        visit "/projects/#{@news_chic.id}"

        expect(current_path).to eq("/projects/#{@news_chic.id}")
      end
    end

    descirbe "I see that project's name and material" do
      xit 'displays project name and material used' do
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("Project Name: News Chic")
        expect(page).to have_content("Material: Newspaper")
        expect(page).to_not have_content("Material: Cardboard Boxes")
      end
    end

    describe "displays theme of the challenge that this project belongs to" do
      xit 'displays theme of the challenge that this project belongs to' do
        visit "/projects/#{@boardfit.id}"

        expect(page).to have_content("Project Name: Boardfit")
        expect(page).to have_content("Material: Cardboard Boxes")
        expect(page).to have_content("Challenge Theme: Recycled Material")
        expect(page).to_not have_content("Material: Newspaper")
        expect(page).to_not have_content("Challenge Theme: Apartment Furnishings")
      end
    end
  end
end