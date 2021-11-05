class Task < ApplicationRecord
  belongs_to :list

  scope :completed, -> { where(complete: true)}
  scope :incompleted, -> { where(complete: false)}

end
