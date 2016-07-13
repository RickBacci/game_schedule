class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @team = Team.find(params[:team_id])
    @game = Game.new
  end

  def create
    @team = Team.find(params[:team_id])
    @game = @team.games.new(game_params)

    if @game.save
      flash[:notice] = 'Game successfully created!'
      redirect_to team_path(@team)
    else
      # flash.now[:error] = 'Game creation unsuccessful!'
      flash[:errors] = @game.errors.messages
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def game_params
    params.require(:game).permit(:team_id, :date, :time, :field)
  end

end
