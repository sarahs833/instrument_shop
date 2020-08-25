class User < ApplicationRecord
  has_secure_password

   def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  #use to find the raw remember_token if match with db bcryted
  def authenticated?(attribute,token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    #user.remember_digest == remember_token?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
