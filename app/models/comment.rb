# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  journey_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :journey
end
