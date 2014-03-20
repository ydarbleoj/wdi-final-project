# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  subject      :text
#  body         :text
#  user_id      :integer
#  recipient_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient
end
