# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  password_digest  :string(255)      not null
#  given_name       :string(255)      not null
#  surname          :string(255)      not null
#  session_token    :string(255)      not null
#  created_at       :datetime
#  updated_at       :datetime
#  activation_token :string(255)      not null
#  activated        :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_reader :password
  
  validates :email, :session_token, :activation_token, presence: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token
  after_initialize :ensure_activation_token
  
  has_many :boards
  has_many :card_assignments
  has_many :board_memberships
  has_many :subscribed_boards, through: :board_memberships, source: :board
  
  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    return nil unless @user
    return nil unless @user.is_password?(password)
    @user
  end
  
  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def all_boards
    self.boards + self.subscribed_boards
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_token
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
    self.session_token ||= self.class.generate_token
  end
  
  def ensure_activation_token
    self.activation_token ||= self.class.generate_token
  end
end
