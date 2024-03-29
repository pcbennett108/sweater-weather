class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :api_key, presence: true, length: { is: 20 }
  has_secure_password
  
  before_validation :generate_api_key, on: :create

  private
  def generate_api_key
    self.api_key = SecureRandom.hex(10)
  end
end