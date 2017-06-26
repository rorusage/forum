class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :post, counter_cache: :comments_count
  validates :content, presence: true

  def editable_by?(user)
    user == author
  end
end
