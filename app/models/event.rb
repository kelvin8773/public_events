class Event < ApplicationRecord
  
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  default_scope -> { order(event_date: :asc) }
  scope :past, -> { where('event_date < :current_date', current_date: DateTime.now) }
  scope :upcoming, -> { where('event_date >= :current_date', current_date: DateTime.now) }

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 256 }
  validates :event_date, presence: true
  validates :location, presence: true
  validates :creator_id, presence: true
  
  def attended?(user_id)
    self.attendees.ids.include?(user_id)
  end

  def pasted?
    self.event_date < Date.today
  end

end
