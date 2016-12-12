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

    it 'has many secrets' do
      expect(user).to respond_to(:secrets)
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

    it 'fails email validation when absent' do
      user.email = ''
      expect(user).to_not be_valid
    end

    it 'fails email validation when duplicate' do
      duplicate_email = 'foo@bar.com'
      create(:user, email: duplicate_email)
      imposter = build(:user, email: duplicate_email)
      expect(imposter).to_not be_valid
    end

    it 'fails password validation' do
      user.password = 'b' * 5
      expect(user).to_not be_valid
      user.password = 'b' * 17
      expect(user).to_not be_valid
    end
  end
end
