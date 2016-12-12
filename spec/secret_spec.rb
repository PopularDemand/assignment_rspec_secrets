require 'rails_helper'

describe Secret do
  context 'valid data provided' do
    let(:secret) { build(:secret) }

    it 'passes title validation' do
      secret.title = 'title'
      expect(secret).to be_valid
    end

    it 'passes body validation' do
      secret.body = 'body'
      expect(secret).to be_valid
    end

    it 'belongs to author' do
      expect(secret).to respond_to(:author)
    end
  end

  context 'invalid data provided' do
    let(:secret) { build(:secret) }

    it 'fails title validation' do
      secret.title = 'b' * 3
      expect(secret).to_not be_valid
      secret.title = 'b' * 25
      expect(secret).to_not be_valid
    end

    it 'fails body validation' do
      secret.body = 'b' * 3
      expect(secret).to_not be_valid
      secret.body = 'b' * 141
      expect(secret).to_not be_valid
    end
  end

  describe '.last_five' do
    it 'returns the secrets w/ the 5 greatest ids' do
      5.times { create(:secret) }
      last_five = Secret.last_five
      expect(last_five.length).to eq(5)
    end
  end
end
