require 'rails_helper'

RSpec.describe Game, type: :model do

  it 'starts out empty' do
    team = Team.create!(name: 'Team Name')

    expect(team.games).to be_empty
  end

  it 'can be created' do
    team = Team.create!(name: 'Team Name')
    team.games.create!(date: '31/07/2016', time: '05:30PM', field: 'Lombardo')

    expect(team.games.size).to eq(1)
  end

end


