class Task < ApplicationRecord
  # belongs_to :user
  validates :subject, presence: true
  validates :assignee, presence: true
  validates :status, presence: true
  validates :description, presence: true
  validates :created_by, presence: true
end
