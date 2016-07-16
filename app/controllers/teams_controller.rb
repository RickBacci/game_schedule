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
    if @team.calendar_id.nil?
      result = client.insert_calendar(calendar)

      @team.update(calendar_id: result.id)

      @team.games.each do |game|
        time = game.time.to_i

        event = Google::Apis::CalendarV3::Event.new(
          {
            summary: 'Game against',
            location: game.field,
            description: 'none',
            start: {
              date_time: Time.at(time).utc.iso8601,
              time_zone: 'America/New_York',
            },
            end: {
              date_time: Time.at(time).utc.iso8601,
              time_zone: 'America/New_York',
            }
          }
        )
        result = client.insert_event(@team.calendar_id, event)

        puts "Event created: #{result.html_link}"
      end
    end

    if result
      flash[:notice] = create_calendar_flash(@team)
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

  def create_calendar_flash(team)
    size = team.games.size

   "Calendar with #{@team.games.size} #{size == 1 ? 'game':'games'} was successfully created!"
  end
end
