class User < ActiveRecord::Base
  attr_reader :password
  
  validates :email, :session_token, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(email, password)
    User.find_by_email(email)
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def full_name
    "#{self.given_name} #{self.surname}"
  end
  
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end