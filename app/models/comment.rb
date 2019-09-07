class Comment < ApplicationRecord
  belongs_to :task

  validates :author, presence: true
  validates :body, presence: true
end
