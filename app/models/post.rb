class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :body, :presence => true

  def header
    "#{self.title} #{self.user.full_name}"
  end
end
