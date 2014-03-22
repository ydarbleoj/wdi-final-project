# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  f_name                 :string(255)
#  l_name                 :string(255)
#  username               :string(255)
#

require 'spec_helper'

def dummy_user(*rm_attribute)
  user = {
    f_name: "bob",
    l_name: "smith",
    email: "bob.smith@gmail.com",
    username: "bobsmith",
    password: "password",
    password_confirmation: "password"}

    unless rm_attribute == []
      rm_attribute.each { |attrib| user.delete(attrib.to_sym) }
    end

end

describe User do

  it "is valid with a first name, last name, email, username, and password" do
    user = User.new(dummy_user)
    expect(user).to be_valid
  end

  it "is valid without a first or last name" do
    user = User.new(dummy_user("f_name", "l_name"))
    expect(user).to be_valid
  end

  it "is invalid without an email address" do
    user = User.new(dummy_user(:email))
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid without a username" do
    user = User.new(dummy_user(:username))
    expect(user).to have(1).errors_on(:username)
  end

  it "is invalid without a password" do
    user = User.new(dummy_user(:password, :password_confirmation))
    expect(user).to have(1).errors_on(:password)
  end

  it "is invalid with a duplicate email address" do
    saved_user = User.create(dummy_user)
    new_user = User.new(dummy_user)
    expect(new_user).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate username" do

  end

  it "returns a user's full name as a string"
end

# def dummy_user
#   user = {
#     f_name: "bob#{rand(0..100)}",
#     l_name: "smith",
#     email: "mailer#{rand(0..100)}@gmail.com",
#     username: "username#{rand(0..100)}",
#     password: "password",
#     password_confirmation: "password"}
# end