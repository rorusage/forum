class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments, :dependent => :destroy

  def editable_by?(user)
    user == author
  end
end
