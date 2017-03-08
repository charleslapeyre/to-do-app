class UserTask < ApplicationRecord
  belongs_to :user

  # validates :due, presence: true
end
