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
end
