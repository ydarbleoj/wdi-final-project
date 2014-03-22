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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :journeys, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message',
            foreign_key: :recipient_id, dependent: :destroy

  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :follows, source: :followed

  has_many :reverse_follows, foreign_key: :followed_id,
            class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :reverse_follows

  accepts_nested_attributes_for :journeys, :comments, :sent_messages, :received_messages

  validates :username, presence: true, uniqueness: { case_sensitive: false }


  def following?(other_user)
    follows.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follows.create!(followed_id: other_user.id)
  end

  def follow(other_user)
    follows.create(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follows.find_by(followed_id: other_user.id).destroy
  end

end
