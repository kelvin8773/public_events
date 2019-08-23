class User < ApplicationRecord

  has_many :events, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  has_secure_password

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end
  
end
