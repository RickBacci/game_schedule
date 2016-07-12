class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path, notice: 'Team successfully created!'
    else
      flash[:error] = 'Team name cannot be blank!'
      render 'new'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
