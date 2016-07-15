class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
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

  def create_calendar
    @team = Team.find(params[:id])

    calendar = Google::Apis::CalendarV3::Calendar.new(
      summary: @team.name,
      time_zone: 'America/New_York'
    )

    client.insert_calendar(calendar)

    if response.status == 200
      flash[:notice] = 'Calendar successfully created!'
      redirect_to team_path(@team)
    else
      flash[:error] = 'Calendar creation unsuccessful!'
      redirect_to team_path(@team)
    end

  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

  def client
    current_user.google_calendar if current_user
  end

end
