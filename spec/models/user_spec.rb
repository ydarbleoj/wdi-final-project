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

describe User do

  it "is valid with a first name, last name, email, username, and password" do
    user = User.new({
      f_name: "bob",
      l_name: "smith",
      email: "bob.smith@gmail.com",
      username: "bobsmith",
      password: "password",
      password_confirmation: "password"
    })
    expect(user).to be_valid
  end

  it "is valid without a first or last name" do
    user = User.new({
      f_name: "bob",
      l_name: "smith",
      email: "bob.smith@gmail.com",
      username: "bobsmith",
      password: "password",
      password_confirmation: "password"
    })
    expect(user).to be_valid
  end

  it "is invalid without an email address" do
    user = User.new({
      f_name: "bob",
      l_name: "smith",
      username: "bobsmith",
      password: "password",
      password_confirmation: "password"
    })
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid without a username" do
    user = User.new({
      f_name: "bob",
      l_name: "smith",
      email: "bob.smith@gmail.com",
      password: "password",
      password_confirmation: "password"
    })
    expect(user).to have(1).errors_on(:username)
  end

  it "is invalid without a password" do
    user = User.new({
      f_name: "bob",
      l_name: "smith",
      email: "bob.smith@gmail.com",
      username: "bobsmith"
    })
    expect(user).to have(1).errors_on(:password)
  end

  it "is invalid with a duplicate email address" do
    saved_user = User.create({
      f_name: "bob",
      l_name: "smith",
      email: "bob.smith@gmail.com",
      username: "bobsmith",
      password: "password",
      password_confirmation: "password"
    })
    new_user = User.new({
      f_name: "kate",
      l_name: "james",
      email: "bob.smith@gmail.com",
      username: "katiej",
      password: "password",
      password_confirmation: "password"
    })

    expect(new_user).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate username" do
    saved_user = User.create({
      f_name: "bob",
      l_name: "smith",
      email: "bob.smith@gmail.com",
      username: "bobsmith",
      password: "password",
      password_confirmation: "password"
    })
    new_user = User.new({
      f_name: "kate",
      l_name: "james",
      email: "kate.james@gmail.com",
      username: "bobsmith",
      password: "password",
      password_confirmation: "password"
    })

    expect(new_user).to have(1).errors_on(:username)

  end



end
