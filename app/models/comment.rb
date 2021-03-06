# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :string(255)
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end
