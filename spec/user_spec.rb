# spec/models/user_spec.rb
require 'rails_helper'

describe User do

  context 'valid data provided' do
    it 'passes name validation' do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
