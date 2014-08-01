# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  list_id     :integer          not null
#  description :text
#  ord         :float            default(0.0)
#  created_at  :datetime
#  updated_at  :datetime
#

class Card < ActiveRecord::Base
  enum status: [:proposed, :active, :finished, :accepted, :rejected]
  enum card_type: [:feature, :issue, :task, :milestone]
  
  validates :title, :list, :ord, presence: true
  
  belongs_to :list
  
  has_many :items, dependent: :destroy
  has_many :card_assignments, dependent: :destroy
  has_many :assignees, through: :card_assignments, source: :user
  
  after_save do |card|
    add_assignee(card.list.board.user)
  end
  
  def add_assignee(user)
    self.assignees << user unless self.assignees.include?(user)
  end
  
  def is_member?(user)
    card_assignments.where(user_id: user.id).exists?
  end
  
  default_scope { order(:ord) }
end