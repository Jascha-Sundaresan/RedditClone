# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  content    :text
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, :sub, :author, presence: true

  belongs_to :sub
  belongs_to(
   :author,
   class_name: "User",
   foreign_key: :author_id)
end
