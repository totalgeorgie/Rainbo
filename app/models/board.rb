# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Board < ActiveRecord::Base
  validates :title, :user, presence: true
  
  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :board_memberships, dependent: :destroy
  has_many :members, through: :board_memberships, source: :user
  
  def is_member?(user)
    return true if user.id == self.user_id
    board_memberships.where(user_id: user.id).exists?
  end
  
  def add_member(user)
    self.members << user unless self.members.include?(user)
  end
end
