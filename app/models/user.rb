class User < ApplicationRecord
  has_many :user_tasks, dependent: :destroy

  # create a user with the hash from facebook API
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
    end
  end

  # pulls the avatar from facebook
  def small_image
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end

  def normal_image
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end

end
