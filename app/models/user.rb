class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, 
                    length: { maximum: 100 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

end
