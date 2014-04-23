# == Schema Information
#
# Table name: journeys
#
#  id         :integer          not null, primary key
#  title      :text
#  user_id    :integer
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
  validates :user_id, presence: true

  def self.all_with_username
    journeys = all.includes(:user)
    journeys_with_user = journeys.as_json
    i = 0

    journeys.each do |journey|
      journeys_with_user[i]["full_name"] = journey.user.full_name
      i += 1
    end
    journeys_with_user
  end
end
