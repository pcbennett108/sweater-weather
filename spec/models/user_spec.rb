require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    subject(:user) { User.create!(email: 'example@example.com', password: 'password', password_confirmation: 'password', api_key: SecureRandom.hex(10)) }

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_presence_of :api_key }
    it { should validate_length_of(:api_key).is_equal_to 20 }
  end

  describe 'Model Methods' do
    it 'can create a new user with an api key' do
      user_params = { email: 'homer@springfield.com', password: 'password', password_confirmation: 'password' }
      user = User.new(user_params)

      expect(user.api_key).to be_nil

      user.send(:generate_api_key)

      expect(user.api_key).to_not be_nil
      expect(user.api_key).to be_a(String)
      expect(user.api_key.length).to eq(20)
    end
  end
end