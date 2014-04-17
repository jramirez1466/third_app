class User < ActiveRecord::Base
  attr_accessible :email, :name

 validates :name, presence: true, length: { maximum: 30}
 VAKLID_EMAIL_REGEX = /\A[\w+\-.]+@[\w+\-.]+\.[+\.[a-z]+\z/i
 validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
end
