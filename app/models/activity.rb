# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  name         :string(255)      not null
#  subject_id   :integer
#  subject_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :user
  
  validates :user_id, :name, :subject_id, :subject_type, presence: true
end
