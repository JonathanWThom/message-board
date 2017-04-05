class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :posts

  validates :first_name, :last_name, :signature, :presence => true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
