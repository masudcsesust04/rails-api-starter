class Todo < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates_presence_of :title, :created_by
end
