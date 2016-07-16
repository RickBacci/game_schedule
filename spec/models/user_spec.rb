require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be created' do
    user = create(:user)

    expect(user).to be_valid
  end

  context '#to_params' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:user_params) { user.to_params}

    it 'returns a Hash' do

      expect(user_params).to respond_to :hash
    end

    it 'has 4 values' do

      expect(user_params.size).to eq(4)
    end

    it 'contains a client_id' do

      expect(user_params[:client_id]).to eq ENV['GOOGLE_CLIENT_ID']
    end

    it 'contains a client_secret' do

      expect(user_params[:client_secret]).to eq ENV['GOOGLE_CLIENT_SECRET']
    end
  end


  context '#fresh_token' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'updates_user_expires_at' do
      user_expires_at = user.expires_at
      user.fresh_token

      expect(user_expires_at).to_not eq(user.expires_at)
    end
  end
end

