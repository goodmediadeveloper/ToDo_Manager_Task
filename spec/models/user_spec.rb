require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensurens admin presente' do
      task = described_class.new(admin: 'admin').save
      expect(task).to eq(false)
    end

    it 'ensurens email presente' do
      task = described_class.new(email: 'email').save
      expect(task).to eq(false)
    end

    it 'ensurens password presente' do
      task = described_class.new(password: 'password').save
      expect(task).to eq(false)
    end
  end
end
