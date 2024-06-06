class Task < ApplicationRecord

  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 200 }

  scope :completed, ->{where(completed: true)}
  scope :not_completed, ->{where(completed: false)}

  def complete!
    update(completed: true, completed_at: Time.current)
  end



end
