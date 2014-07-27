# == Schema Information
#
# Table name: board_memberships
#
#  id         :integer          not null, primary key
#  board_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class BoardMembership < ActiveRecord::Base
  validates :board_id, :user_id, presence: true
  
  belongs_to :user
  belongs_to :board
end
