# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
end
