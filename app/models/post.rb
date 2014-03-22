# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  video      :string(255)
#  photo      :string(255)
#  text       :text
#  caption    :text
#  journey_id :integer
#  title      :text
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

class Post < ActiveRecord::Base
  belongs_to :journey
  has_many :comments, as: :commentable, dependent: :destroy
  validates :type, presence: true, inclusion: { in: ["photo", "text", "video"] }
end
