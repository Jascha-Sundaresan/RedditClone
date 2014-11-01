# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  session_token   :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :email, :name, :password_digest, :session_token, presence: true
  validates :email, :name, uniqueness: true
  validates :password, length: { minimum: 3, allow_nil: true }
  after_initialize :ensure_session_token
  
  has_many(
    :subs,
    foreign_key: :moderator_id,
    dependent: :destroy
  )
  
  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)
    user.try(:is_password?, password) ? user : nil
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = generate_session_token
  end
  
  def generate_session_token
     SecureRandom.urlsafe_base64(16)
   end
  
  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
