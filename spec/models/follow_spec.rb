# == Schema Information
#
# Table name: follows
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Follow do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }

  it "allows one user to follow another user" do
    relationship = follower.follows.build(followed_id: followed.id)

    expect(relationship).to be_valid
  end

  it "lists a user's followers"



end
