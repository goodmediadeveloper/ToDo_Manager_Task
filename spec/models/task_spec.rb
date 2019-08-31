require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validation tests' do
    it 'ensurens subject presente' do
      task = Task.new(subject: 'subject').save
      expect(task).to eq(false)
    end

    it 'ensurens assignee presente' do
      task = Task.new(assignee: 'assignee').save
      expect(task).to eq(false)
    end

    it 'ensurens status presente' do
      task = Task.new(status: 'status').save
      expect(task).to eq(false)
    end

    it 'ensurens description presente' do
      task = Task.new(description: 'description').save
      expect(task).to eq(false)
    end

    it 'ensurens created_by presente' do
      task = Task.new(created_by: 'created_by').save
      expect(task).to eq(false)
    end  
    
    it 'shold save successfuly' do
      task = Task.new(subject: 'subject', assignee: 'assignee', status: 'status', description: 'description', created_by: 'created_by').save
      expect(task).to eq(true)
    end   
  end

  context 'scope tests' do
    
  end  
end
