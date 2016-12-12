# spec/models/user_spec.rb
require 'rails_helper'

describe User do
  context 'valid data provided' do
    let(:user) { build(:user) }
    it 'passes name validation' do
      user.name = 'sam'
      expect(user).to be_valid
    end

    it 'passes email validation' do
      user.email = 'foo@bar.com'
      expect(user).to be_valid
    end

    it 'passes password validation' do
      user.password = 'foobar'
      expect(user).to be_valid
    end
  end

  context 'invalid data provided' do
    let(:user) { build(:user) }
    it 'fails name validation' do
      user.name = ''
      expect(user).to_not be_valid
      user.name = 'bo'
      expect(user).to_not be_valid
      user.name = 'b' * 21
      expect(user).to_not be_valid
    end

    it 'fails email validation' do
      
      user.email = ''
      expect(user).to_not be_valid

    end
  end
end
