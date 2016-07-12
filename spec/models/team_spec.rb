require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'has a name' do

    it 'that is valid' do
      team = Team.create!(name: 'Team Name')

      expect(team).to be_valid
    end

    it 'that is not empty' do
      team = Team.create(name: '')

      expect(team).to be_invalid
    end

    it 'that is unique' do
      Team.create!(name: 'Team Name')
      team = Team.create(name: 'Team Name')

      expect(team).to be_invalid
    end

    it 'that is not longer than 30 characters' do
      team = Team.create(name: 'x' * 31)

      expect(team).to be_invalid
    end

  end
end
