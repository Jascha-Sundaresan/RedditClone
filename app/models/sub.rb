# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  moderator   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true
  validates :title, uniqueness: true
  
  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id
  )
end
