class User < ApplicationRecord
  has_many :created_event, foreign_key  => :creator, class_name => 'Event'

  has_secure_password

end
