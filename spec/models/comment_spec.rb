require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    it 'ensurens author presente' do
      task = described_class.new(author: 'author').save
      expect(task).to eq(false)
    end

    it 'ensurens body presente' do
      task = described_class.new(body: 'body').save
      expect(task).to eq(false)
    end
  end
end
