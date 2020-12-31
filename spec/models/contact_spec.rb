require 'rails_helper'

RSpec.describe Contact, type: :model do
  # let(:described_object) { build :contact }
  let(:described_object) { FactoryBot.build(:contact) }

  it "has a valid factory" do
    expect(described_object).to be_valid
  end

  describe '#name' do
    it 'should be defined' do
      expect(described_object).to respond_to :name
    end

    it 'should be required' do
      described_object.name = nil
      expect(described_object).to_not be_valid
    end
  end

  describe '#email' do
    it 'should be defined' do
      expect(described_object).to respond_to :email
    end

    it 'should be required' do
      described_object.email = nil
      expect(described_object).to_not be_valid
    end
  end

  describe '#subject' do
    it 'should be defined' do
      expect(described_object).to respond_to :subject
    end

    it 'should be required' do
      described_object.subject = nil
      expect(described_object).to_not be_valid
    end
  end

  describe '#message' do
    it 'should be defined' do
      expect(described_object).to respond_to :message
    end

    it 'should be required' do
      described_object.message = nil
      expect(described_object).to_not be_valid
    end

    it 'should not include obscenities' do
      described_object.message += 'shit'
      expect(described_object).to_not be_valid
    end
  end
end