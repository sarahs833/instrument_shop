class User < ApplicationRecord

  attr_accessor :activate_token,:reset_token

  validates :name, presence: true, length: { maximum:50 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX},
                           uniqueness: true

  before_create :set_activation_digest
  has_secure_password


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #use to find the raw remember_token if match with db bcryted
  def authenticated?(attribute,token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    #user.remember_digest == remember_token?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def set_activation_digest
    self.activate_token = User.new_token
    digest = User.digest(self.activate_token)
    self.activation_digest = digest
  end

  def send_activation_mail
    UserMailer.account_activation(self).deliver_now
  end

  def set_reset_digest
    self.reset_token = User.new_token
    digest = User.digest(self.reset_token)
    self.update(reset_digest: digest)
  end

  def send_reset_password
    UserMailer.password_reset(self).deliver_now
  end
end
